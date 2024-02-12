let allLinks = document.querySelectorAll('.links a');
let activePage = window.location.pathname;

const pathParts = activePage.split('/');
const firstPart = pathParts[ 1 ];

allLinks.forEach(function (link) {
    if (link.href.includes(`${firstPart}`)) {
        link.classList.add("active");
    }
});
