window.addEventListener('load', (event) => {
  main()
});

function main() {
  console.log({ w: window.innerWidth, h: window.innerHeight })
}

function populateUsers(users) {
  console.log(users)
}

function addObservers() {
  bms.observe("formula", {
    formulas: ["admins \\/ clients"],
    trigger: function (origin, values) {
      console.log({origin, values})
    }
  })
}