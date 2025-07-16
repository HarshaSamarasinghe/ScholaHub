// sidebar.js

document.addEventListener('DOMContentLoaded', function() {
    const menuItems = document.querySelectorAll('.side-menu li a');

    // Get the active item from localStorage, if any
    const activeMenuItem = localStorage.getItem('activeMenuItem');

    // Set the active class based on the saved item in localStorage
    if (activeMenuItem) {
        menuItems.forEach(item => {
            const parentLi = item.parentElement;
            parentLi.classList.remove('active');
            if (item.getAttribute('href') === activeMenuItem) {
                parentLi.classList.add('active');
            }
        });
    }

    // Add click event listeners to each menu item
    menuItems.forEach(item => {
        item.addEventListener('click', function() {
            // Remove active class from all menu items
            menuItems.forEach(menuItem => menuItem.parentElement.classList.remove('active'));

            // Set the clicked menu item as active
            const parentLi = this.parentElement;
            parentLi.classList.add('active');

            // Save the active item to localStorage
            localStorage.setItem('activeMenuItem', this.getAttribute('href'));
        });
    });
});


// Function to handle the click event and toggle active class
function setActiveMenu() {
    // Get all the menu items
    const menuItems = document.querySelectorAll('.side-menu li');

    // Loop through each item and add a click event listener
    menuItems.forEach(item => {
        item.addEventListener('click', function() {
            // Remove active class from all menu items
            menuItems.forEach(i => i.classList.remove('active'));
            
            // Add active class to the clicked item
            this.classList.add('active');
        });
    });
}

// Call the function to apply the click event listeners
window.onload = setActiveMenu;




