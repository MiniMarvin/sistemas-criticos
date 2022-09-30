'use strict'

/**
 * @type {{users: string[], admins: string[], clients: string[], pages: Set<string>, currentPage: string}}
 */
const state = {
  users: [],
  admins: [],
  clients: [],
  pages: new Set(),
  currentPage: ''
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
    // currentTime,virtualMachines,instanceRating: triggers billing update
    formulas: ["clients"],
    trigger: function (_, values) {
      console.log('[clients] update:', { values })
      const newClients = parseSet(values[0])
      // TODO: update to figure how to handle only new values
      if (state.clients != newClients) {
        state.clients = newClients
      } else {
        return
      }

      // TODO: In order to let it work by clicking in the user the billing will be retrieved
      // So it's the ugly way but works :/
      const clientsData = state.clients.map(client => {
        return {
          id: client,
          'consumo (R$)': '?',
          '# EC2': '?',
          '# spots': '?',
        }
      })

      replaceTable('usersTable', clientsData, ['id', 'consumo (R$)', '# EC2', '# spots'])
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
      console.log('[currentUser]updated:', { currentUser })
      if (!currentUser || currentUser === 'none') {
        setPage('loginScreen')
      } else {
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
}

function addHtmlEventHandlers() {
  document.getElementById('reloadUsersView').onclick = () => {
    const billingPromises = state.clients.map(client => {
      return executeOperation('getBillingForUser', `user=${client}`)
    })
    Promise.all(billingPromises).then(billings => {
      console.log('[reload billing]', { billings })
    }).catch(err => {
      console.log('[reload billing ERROR]', { err })
    })
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
      td.innerText = val[header] || ''
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
    console.log('[freeGroup -> 0]', { operationGroup, freeGroup })
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

//===================================
// Event Listenners
//===================================
window.addEventListener('load', (event) => {
  main()
});