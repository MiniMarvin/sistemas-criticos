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
 *  currentUser: string,
 *  pages: Set<string>, 
 *  currentPage: string
 *  mrData: {[key:string]: {
 *    id: string,
 *    mem: number,
 *    cpu: number,
 *    hdd: number
 *  }}
 * }}
 */
const state = {
  users: [],
  admins: [],
  clientsData: [],
  currentUser: '',
  pages: new Set(),
  currentPage: '',
  mrData: {}
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
    selector: '#shadow',
    formulas: ["clients"],
    trigger: function (_, values) {
      const newClients = parseSet(values[0])
      const keepTable = {}
      const keepData = state.clientsData.filter(data => {
        const willKeep = newClients.includes(data.id)
        keepTable[data.id] = willKeep
        return willKeep
      })

      const newData = newClients.filter(client => {
        return !keepTable[client]
      }).map(client => {
        return {
          id: client,
          'consumo (R$)': '?',
          '# EC2': '?',
          '# spots': '?',
        }
      })

      state.clientsData = [...keepData, ...newData]
      replaceUsersTable(state.clientsData)
    }
  })

  bms.observe("formula", {
    selector: '#shadow',
    formulas: ["virtualMachineProperties"],
    translate: true,
    trigger: (_, values) => {
      console.log('[VM_PROPERTIES] ', { values })
    }
  })

  bms.observe("formula", {
    selector: '#shadow',
    formulas: ["machineResourceProperties"],
    translate: true,
    trigger: (_, values) => {
      const mrProps = {}
      const data = values[0].map(v => {
        const mrProp = {
          id: v[0],
          mem: v[1].mem,
          cpu: v[1].cpu,
          hdd: v[1].hdd
        }
        mrProps[v[0]] = mrProp
        return mrProp
      })

      state.mrData = mrProps
      replaceResourcesTable(data)
      // console.log('[MACHINE_RESOURCES_PROPERTIES] ', { mrProps })
    }
  })

  // Update the currentUsers
  bms.observe("formula", {
    selector: '#usernameSelector',
    formulas: ["admins \\/ clients"],
    trigger: function (_, values) {
      console.log('[user pool] update:', { values })
      const users = parseSet(values[0])
      updateUserPool(users)
    }
  })

  bms.observe("formula", {
    selector: '#shadow',
    formulas: ["currentUser"],
    trigger: function (_, values) {
      const currentUser = values[0]
      console.log('[currentUser] updated:', { currentUser })
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
    selector: '#addResource',
    events: [
      {
        name: 'addResource',
        predicate: () => {
          console.log(`[addResource] trying predicate...`)
          const mem = document.getElementById('addResourceMem').value
          const hdd = document.getElementById('addResourceHdd').value
          const cpu = document.getElementById('addResourceCpu').value
          const myPredicate = `mem=${mem}&hdd=${hdd}&cpu=${cpu}`
          console.log(`[addResource]${myPredicate}`)
          return myPredicate
        }
      }
    ],
    callback: () => {
      console.log(`[addResource_CALLBACK] executed...`)
    }
  })
}

function addHtmlEventHandlers() {
  document.getElementById('reloadUsersView').onclick = () => {
    const billingPromises = state.clientsData.map(client => {
      return executeOperation('getBillingForUser', `user=${client.id}`)
    })
    Promise.all(billingPromises).then(billings => {
      console.log('[reload billing]', { billings })
      state.clientsData.forEach((client, idx) => {
        client['consumo (R$)'] = billings[idx][0]
      })
    }).catch(err => {
      console.log('[reload billing ERROR]', { err })
    })
  }

  document.getElementById('reloadResourcesView').onclick = () => {

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

function login() {

}

/**
 * 
 * @param {string} pageId 
 */
function setPage(pageId) {
  console.log(`[setPage] setting page ${pageId}`)
  if (state.pages.size === 0) {
    const pages = document.getElementsByTagName('main')
    console.log(`page count: ${pages.length}`)
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
      // console.log({ i, val })
      td.innerText = val[header] || '?'
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
    queryExecutor.setAttribute('style', 'width: 20px;height:20px; background-color:orange')
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
        console.log(`[OPERATION_CALLBACK|${operation}|${randomId}]`, returnValues)
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
    console.log('[freeGroup /= 0]', { operationGroup, freeGroup })
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
  replaceTable('usersTable', data || [], ['id', 'consumo (R$)', '# EC2', '# spots'])
}

function replaceResourcesTable(data) {
  replaceTable('resourcesTable', data, ['id', 'hdd', 'hdd_livre', 'cpu', 'cpu_livre', 'mem', 'mem_livre', 'vms'])
}

//===================================
// Event Listenners
//===================================
window.addEventListener('load', (event) => {
  main()
});