'use strict'

/**
 * @type {{users: string[], pages: Set<string>, currentPage: string, admins: string[]}}
 */
const state = {
  users: [],
  admins: [],
  pages: new Set(),
  currentPage: ''
}

function main() {
  console.log({ w: window.innerWidth, h: window.innerHeight })
  setPage('loginScreen')
  addObservers()
  addHandlers()
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
        console.log('-->', state.admins, currentUser, state.admins.includes(currentUser))
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
        predicate: () => {}
      }
    ]
  })
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

window.addEventListener('load', (event) => {
  main()
});
