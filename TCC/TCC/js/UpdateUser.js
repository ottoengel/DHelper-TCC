import UserService from 'fetch.js';
const userService = new UserService();

const updateButton = document.getElementById('user-btn');
updateButton.onclick = () => {
    userService.updateUser();
};