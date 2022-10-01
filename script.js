'use strict'

/**
 * @type {{
 *  users: string[], 
 *  admins: string[], 
 *  clientsData: {
 *    id: string,
 *    'consumo (R$)': string,
 *    '# EC2': string,
 *    '# spots': string,
 *  }[], 
 *  instanceRatings: {
 *   allocated: {
 *     cpu: number,
 *     mem: number,
 *     hdd: number
 *   },
 *   spot: {
 *     cpu: number,
 *     mem: number,
 *     hdd: number
 *   },
 *  },
 *  currentUser: string,
 *  pages: Set<string>, 
 *  currentPage: string,
 *  mrData: {[key:string]: {
 *    id: string,
 *    mem: number,
 *    cpu: number,
 *    hdd: number
 *  }},
 *  vmProperties: {[key:string]: {
 *    vm: string,
 *    residentMachine: string,
 *    owner: string,
 *    category: string,
 *    startTime: number,
 *    cpu: number,
 *    hdd: number,
 *    mem: number
 *  }},
 *  used: {[key: string]: {
 *    cpu: number,
 *    hdd: number,
 *    mem: number
 *  }},
 *  clientData: {[key:string]: {
 *    vms: [{
 *      id: string,
 *      tipo: string,
 *      'consumo / hora': number
 *      consumo: number,
 *      cpu: number,
 *      mem: number,
 *      hdd: number
 *    }]
 *  }},
 *  currentTime: number
 * }}
 */
const state = {
  users: [],
  admins: [],
  instanceRatings: {
    allocated: {
      cpu: 0,
      mem: 0,
      hdd: 0,
    },
    spot: {
      cpu: 0,
      mem: 0,
      hdd: 0,
    },
  },
  clientsData: [],
  currentUser: '',
  pages: new Set(),
  currentPage: '',
  mrData: {},
  vmProperties: {},
  used: {},
  clientData: {},
  currentTime: 0
}

function main() {
  // console.log({ w: window.innerWidth, h: window.innerHeight })
  setPage('loginScreen')
  addObservers()
  addHandlers()
  addHtmlEventHandlers()
}

//===================================
// Observers & Handlers
//===================================

function addObservers() {
  bms.init(() => {
    console.log('did init')
    replaceUsersTable([])
    replaceResourcesTable([])
    replaceUserVmsTable([])
  })

  bms.observe("formula", {
    selector: '#shadow',
    formulas: ["instanceRating"],
    translate: true,
    trigger: function (_, values) {
      // console.log('[instanceRating] update:', { values })
      const ratings = {}
      values[0].forEach(g => {
        ratings[g[0]] = g[1]
      })
      state.instanceRatings = ratings
    }
  })

  bms.observe("formula", {
    selector: '#shadow',
    formulas: ["admins"],
    trigger: function (_, values) {
      console.log('[admins] update:', { values })
      state.admins = parseSet(values[0])
    }
  })

  bms.observe("formula", {
    selector: '#ticker',
    formulas: ["currentTime"],
    trigger: function (_, values) {
      // console.log('[currentTime] update:', { values })
      state.currentTime = values[0]
      document.getElementById('ticker').innerText = `+ ${state.currentTime}`
    }
  })

  bms.observe("formula", {
    selector: '#shadow',
    formulas: ["clients"],
    trigger: function (_, values) {
      const newClients = parseSet(values[0])
      const keepTable = {}
      const keepData = state.clientsData.filter(data => {
        const willKeep = newClients.includes(data.id)
        keepTable[data.id] = willKeep
        return willKeep
      }).map(dt => {
        const userVms = (state.clientData[dt.id] || {}).vms || []
        dt['# EC2'] = userVms.filter(d => d.tipo == 'allocated').length
        dt['# spots'] = userVms.length - dt['# EC2']
        return dt
      })

      const newData = newClients.filter(client => {
        if (!client) return false
        return !keepTable[client]
      }).map(client => {
        return {
          id: client,
        }
      })

      state.clientsData = [...keepData, ...newData]
      // console.log(`[update clients]`, { clientsData: state.clientsData })
      replaceUsersTable(state.clientsData)
    }
  })

  bms.observe("formula", {
    selector: '#shadow',
    formulas: ["virtualMachineProperties"],
    translate: true,
    trigger: (_, values) => {
      const vmProperties = {}
      const used = {}
      const clientData = {}

      values[0].forEach(v => {
        const vmProp = {
          vm: v[0],
          residentMachine: v[1].residentMachine.value,
          owner: v[1].owner.value,
          category: v[1].category.value,
          startTime: v[1].startTime,
          cpu: v[1].cpu,
          hdd: v[1].hdd,
          mem: v[1].mem,
        }

        vmProperties[vmProp.vm] = vmProp

        if (!used[vmProp.residentMachine]) {
          used[vmProp.residentMachine] = { mem: 0, cpu: 0, hdd: 0 }
        }
        if (used[vmProp.residentMachine]) {
          used[vmProp.residentMachine].mem += vmProp.mem
          used[vmProp.residentMachine].cpu += vmProp.cpu
          used[vmProp.residentMachine].hdd += vmProp.hdd
        } else {
          used[vmProp.residentMachine].mem = 0
          used[vmProp.residentMachine].cpu = 0
          used[vmProp.residentMachine].hdd = 0
        }

        // console.log()
        if (!clientData[v[1].owner.value]) {
          clientData[v[1].owner.value] = { vms: [] }
        }

        const hourlyCost = state.instanceRatings[v[1].category.value].cpu * v[1].cpu
          + state.instanceRatings[v[1].category.value].mem * v[1].mem
          + state.instanceRatings[v[1].category.value].hdd * v[1].hdd
        // console.log('>>>', {
        //   hc: hourlyCost * (state.currentTime - v[1].startTime)
        // })
        clientData[v[1].owner.value].vms.push({
          id: v[0],
          tipo: v[1].category.value,
          'consumo / hora': hourlyCost,
          consumo: hourlyCost * (state.currentTime - v[1].startTime),
          cpu: v[1].cpu,
          mem: v[1].mem,
          hdd: v[1].hdd,
        })
      })

      state.clientData = clientData
      state.vmProperties = vmProperties
      state.used = used
      // console.log('[VM_PROPERTIES] ', { used, vmProperties, clientData })
      updateUsedMachineResources()
    }
  })

  bms.observe("formula", {
    selector: '#shadow',
    formulas: ["machineResourceProperties"],
    translate: true,
    trigger: (_, values) => {
      const mrProps = {}
      const data = values[0].map(v => {
        // console.log(`[machineResourceProperties]`, { v })
        const mrProp = {
          id: v[0],
          mem: v[1].mem,
          cpu: v[1].cpu,
          hdd: v[1].hdd
        }

        mrProps[v[0]] = mrProp
        return {
          id: mrProp.id,
          hdd: mrProp.hdd,
          mem: mrProp.mem,
          cpu: mrProp.cpu,
          mem_livre: mrProp.mem - ((state.used[mrProp.id] || {}).mem || 0),
          cpu_livre: mrProp.cpu - ((state.used[mrProp.id] || {}).cpu || 0),
          hdd_livre: mrProp.hdd - ((state.used[mrProp.id] || {}).hdd || 0),
        }
      })

      state.mrData = mrProps
      // console.log({ mrProps, data })
      replaceResourcesTable(data)
    }
  })

  // Update the currentUsers
  bms.observe("formula", {
    selector: '#usernameSelector',
    formulas: ["admins \\/ clients"],
    trigger: function (_, values) {
      // console.log('[user pool] update:', { values })
      const users = parseSet(values[0])
      updateUserPool(users)
    }
  })

  bms.observe("formula", {
    selector: '#shadow',
    formulas: ["currentUser"],
    trigger: function (_, values) {
      const currentUser = values[0]
      // console.log('[currentUser] updated:', { currentUser })
      if (!currentUser || currentUser === 'none') {
        setPage('loginScreen')
      } else {
        if (state.currentUser === currentUser) {
          return
        }

        state.currentUser = currentUser
        if (state.admins.includes(currentUser)) {
          setPage('adminScreen')
        } else {
          setPage('userScreen')
          if (state.clientData[currentUser]) {
            replaceUserVmsTable(state.clientData[currentUser].vms)
          }
        }
      }
    }
  })
}

function addHandlers() {
  bms.executeEvent({
    selector: '#loginBtn',
    events: [
      {
        name: 'login',
        predicate: (origin) => {
          const p = "user=" + document.getElementById('usernameSelector').value
          return p
        }
      }
    ]
  })

  bms.executeEvent({
    selector: '.loginBtn',
    events: [
      {
        name: 'login',
        predicate: (origin) => {
          const p = "user=" + document.getElementById('usernameSelector').value
          return p
        }
      }
    ]
  })

  bms.executeEvent({
    selector: '.logoutBtn',
    events: [
      {
        name: 'logout',
        predicate: () => { }
      }
    ]
  })

  bms.executeEvent({
    selector: '#addUser',
    events: [
      {
        name: 'addArbitraryClient',
        predicate: () => { }
      }
    ]
  })

  bms.executeEvent({
    selector: '#ticker',
    events: [
      {
        name: 'tickTimer',
        predicate: () => { }
      }
    ]
  })

  bms.executeEvent({
    selector: '#addResource',
    events: [
      {
        name: 'addResource',
        predicate: () => {
          // console.log(`[addResource] trying predicate...`)
          const mem = document.getElementById('addResourceMem').value
          const hdd = document.getElementById('addResourceHdd').value
          const cpu = document.getElementById('addResourceCpu').value
          const myPredicate = `mem=${mem}&hdd=${hdd}&cpu=${cpu}`
          // console.log(`[addResource]${myPredicate}`)
          return myPredicate
        }
      }
    ],
    callback: () => {
      // console.log(`[addResource_CALLBACK] executed...`)
    }
  })

  bms.executeEvent({
    selector: '#addUserVmAllocated',
    events: [
      {
        name: 'addAllocatedVirtualMachine',
        predicate: () => {
          // console.log(`[addAllocatedVirtualMachine] trying predicate...`)
          const mem = document.getElementById('addVmMem').value
          const hdd = document.getElementById('addVmHdd').value
          const cpu = document.getElementById('addVmCpu').value
          const myPredicate = `mem=${mem}&hdd=${hdd}&cpu=${cpu}&client=${state.currentUser}`
          // console.log(`[addAllocatedVirtualMachine]${myPredicate}`)
          return myPredicate
        }
      }
    ],
  })

  bms.executeEvent({
    selector: '#addUserVmSpot',
    events: [
      {
        name: 'addSpotVirtualMachine',
        predicate: () => {
          // console.log(`[addSpotVirtualMachine] trying predicate...`)
          const mem = document.getElementById('addVmMem').value
          const hdd = document.getElementById('addVmHdd').value
          const cpu = document.getElementById('addVmCpu').value
          const myPredicate = `mem=${mem}&hdd=${hdd}&cpu=${cpu}&client=${state.currentUser}`
          // console.log(`[addSpotVirtualMachine]${myPredicate}`)
          return myPredicate
        }
      }
    ],
  })
}

function addHtmlEventHandlers() {
  document.getElementById('reloadUsersView').onclick = () => {
    const billingPromises = state.clientsData.map(client => {
      return executeOperation('getBillingForUser', `user=${client.id}`)
    })
    Promise.all(billingPromises).then(billings => {
      // console.log('[reload billing]', { billings })
      state.clientsData.forEach((client, idx) => {
        client['consumo (R$)'] = billings[idx][0]
      })
    }).catch(err => {
      console.error('[reload billing ERROR]', { err })
    })
  }

  document.getElementById('reloadUserVmsView').onclick = () => {
    // console.log(`[reloadUserVmsView]`, { state })
    if (state.clientData[state.currentUser]) {
      replaceUserVmsTable(state.clientData[state.currentUser].vms)
    }
  }

  document.getElementById('resources-view').onclick = () => {
    setPage('adminResourcesScreen')
  }

  document.getElementById('users-view').onclick = () => {
    setPage('adminScreen')
  }
}

//===================================
// B Integration
//===================================
/**
 * 
 * @param {string} setStr 
 */
function parseSet(setStr) {
  if (!setStr) return []
  const values = setStr.replace(/[\{\}]/g, '').split(',')
  return values
}

//===================================
// State Management
//===================================
function updateUserPool(users) {
  state.users = users
  replaceOptions('usernameSelector', users)
}

function updateUsedMachineResources() {
  // console.log('>>>>', { used: state.used, mrData: state.mrData })
  if (Object.keys(state.mrData).length === 0) {
    return
  }

  const computedTable = Object.keys(state.mrData).map(key => {
    return {
      id: key,
      mem: state.mrData[key].mem,
      cpu: state.mrData[key].cpu,
      hdd: state.mrData[key].hdd,
      mem_livre: state.mrData[key].mem - ((state.used[key] || {}).mem || 0),
      cpu_livre: state.mrData[key].cpu - ((state.used[key] || {}).cpu || 0),
      hdd_livre: state.mrData[key].hdd - ((state.used[key] || {}).hdd || 0),
    }
  })
  // console.log({ computedTable })
  replaceResourcesTable(computedTable)
}

/**
 * 
 * @param {string} pageId 
 */
function setPage(pageId) {
  // console.log(`[setPage] setting page ${pageId}`)
  if (state.pages.size === 0) {
    const pages = document.getElementsByTagName('main')
    // console.log(`page count: ${pages.length}`)
    for (let i = 0; i < pages.length; i++) {
      state.pages.add(pages[i].getAttribute('id'))
      pages[i].classList.add('hidden')
    }
  }

  if (state.pages.has(pageId) && state.currentPage !== pageId) {
    document.getElementById(pageId).classList.remove('hidden')

    if (state.currentPage) {
      document.getElementById(state.currentPage).classList.add('hidden')
    }

    state.currentPage = pageId
  } else {
    console.log(`[setPage] ${pageId} not found`)
  }
}

//===================================
// DOM Modifications
//===================================

/**
 * 
 * @param {string} id 
 * @param {string[]} options 
 */
function replaceOptions(id, options) {
  const nodes = options.map((option) => {
    const node = document.createElement('option')
    node.value = option
    node.text = option
    return node
  })

  const selector = document.getElementById(id)
  selector.textContent = ""
  nodes.forEach(node => {
    selector.appendChild(node)
  })
}

/**
 * 
 * @param {string} id 
 * @param {{[key: string]: string}[]} values 
 */
function replaceTable(id, values, headers) {
  // console.log({ id, headers })
  const headerRow = document.createElement('tr')
  headers.forEach(header => {
    const th = document.createElement('th')
    th.innerText = header
    headerRow.appendChild(th)
  })

  const rows = values.map((val, i) => {
    const tr = document.createElement('tr')
    headers.forEach((header, j) => {
      const td = document.createElement('td')
      td.id = `${id}-td-${i}-${j}`
      const colClass = `${id}_${headers[j].replace(/[#()\\/\.]/g, '').replace(' ', '')}`.replace(' ', '')
      console.log({ colClass })
      td.classList.add(colClass)
      let txt = '?'
      if (val[header] !== undefined && val[header] !== null) txt = val[header]
      td.innerText = txt
      tr.appendChild(td)
    })
    return tr
  })

  const tableSelector = document.getElementById(id)
  tableSelector.innerHTML = ""
  tableSelector.appendChild(headerRow)
  rows.forEach(row => {
    tableSelector.appendChild(row)
  })
}

//===================================
// Custom operations
//===================================
/**
 * @type {{[key:string]: {[key: string]: {predicate: ()=>string, callback: ()=>void}}}}
 */
const operationGroup = {}
/**
 * @type {{[key: string]: string[]}}
 */
const freeGroup = {}

function makeId(length) {
  var result = '';
  var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  var charactersLength = characters.length;
  for (var i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() *
      charactersLength));
  }
  return result;
}

/**
 * 
 * @param {string[]} operations The list of operations you want to execute.
 * @param {boolean} translate Defines if BMotion should translate the operations to JS objects.
 * @returns {Promise<string[]>} The result of the operations in string fashion for b.
 */
function executeOperation(operation, predicate) {
  let group = document.getElementById('minimarvin-operation-group')
  if (!group) {
    group = document.createElement('div')
    group.id = 'minimarvin-operation-group'
    document.getElementsByTagName('body')[0].appendChild(group)
  }

  if (operationGroup[operation] === undefined) {
    operationGroup[operation] = {}
    freeGroup[operation] = []
  }

  let usedExecutor = Promise.resolve()
  if (freeGroup[operation].length === 0) {
    // console.log('[freeGroup -> 0]', { operationGroup, freeGroup })
    // setup new executor
    const randomId = makeId(10)
    operationGroup[operation][randomId] = {
      predicate: () => '',
      callback: () => { }
    }

    // append it to page
    const queryExecutor = document.createElement('div')
    queryExecutor.id = randomId
    // queryExecutor.setAttribute('style', 'width: 20px;height:20px; background-color:orange')
    group.appendChild(queryExecutor)

    // add listener to execute functions on it
    bms.handler('executeEvent', {
      selector: `#${randomId}`,
      events: [
        {
          name: operation,
          predicate: () => {
            return operationGroup[operation][randomId].predicate()
          },
        }
      ],
      callback: (_, value) => {
        const returnValues = value.returnValues
        // console.log(`[OPERATION_CALLBACK|${operation}|${randomId}]`, returnValues)
        freeGroup[operation].push(randomId)
        operationGroup[operation][randomId].callback(returnValues)
      }
    })
    usedExecutor = new Promise((acc, _) => {
      setTimeout(() => {
        acc(randomId)
      }, 100)
    })
  } else {
    // console.log('[freeGroup /= 0]', { operationGroup, freeGroup })
    usedExecutor = Promise.resolve(freeGroup[operation].pop())
  }

  return usedExecutor.then(executor => {
    return new Promise((acc, _) => {
      operationGroup[operation][executor].predicate = () => predicate
      operationGroup[operation][executor].callback = (returns) => {
        acc(returns)
      }
      document.getElementById(executor).click()
    })
  })
}


function replaceUsersTable(data) {
  replaceTable('usersTable', data, ['id', 'consumo (R$)', '# EC2', '# spots'])

  bms.executeEvent({
    selector: '.usersTable_id',
    events: [
      {
        name: 'removeClient',
        predicate: (nodes) => {
          const node = nodes[0]
          // console.log(`node:`, node, node.innerText)
          const toRemove = node.innerText
          const myPredicate = `user=${toRemove}`
          return myPredicate
        }
      }
    ],
  })
}

function replaceResourcesTable(data) {
  replaceTable('resourcesTable', data, ['id', 'hdd', 'hdd_livre', 'cpu', 'cpu_livre', 'mem', 'mem_livre'])

  bms.executeEvent({
    selector: '.resourcesTable_id',
    events: [
      {
        name: 'removeResource',
        predicate: (nodes) => {
          const node = nodes[0]
          console.log(`node:`, node, node.innerText)
          const toRemove = node.innerText
          const myPredicate = `resource=${toRemove}`
          return myPredicate
        }
      }
    ],
  })
}

function replaceUserVmsTable(data) {
  replaceTable('userVmsTable', data, ['id', 'consumo / hora', 'consumo', 'tipo', 'mem', 'cpu', 'hdd'])

  bms.executeEvent({
    selector: '.userVmsTable_id',
    events: [
      {
        name: 'removeVirtualMachine',
        predicate: (nodes) => {
          const node = nodes[0]
          console.log(`node:`, node, node.innerText)
          const toRemove = node.innerText
          const myPredicate = `vm=${toRemove}`
          return myPredicate
        }
      }
    ],
  })
}

//===================================
// Event Listenners
//===================================
window.addEventListener('load', (event) => {
  main()
});