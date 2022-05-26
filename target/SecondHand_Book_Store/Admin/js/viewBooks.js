import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.4/firebase-app.js";
import { getDatabase, ref, onValue, remove} from 'https://www.gstatic.com/firebasejs/9.6.4/firebase-database.js';

// Your web app's Firebase configuration
const firebaseConfig = {
    apiKey: "AIzaSyAARVObDcEYn1GQ5shl58Srqk40bjtk-PI",
    authDomain: "secondhand-book-241ae.firebaseapp.com",
    projectId: "secondhand-book-241ae",
    storageBucket: "secondhand-book-241ae.appspot.com",
    messagingSenderId: "252665153542",
    appId: "1:252665153542:web:ed9ddc9225c7f4573adb87"
};
const app = initializeApp(firebaseConfig);

let usersData = [];
const db = getDatabase();
var Data = [];

onload = getUsers();

function getUsers() {
    var table = document.querySelector("table");
    var tableHead = table.querySelector("thead");
    var tableBody = table.querySelector("tbody");

    tableHead.innerHTML = '<div class="text-center"> <div class="spinner-border" role="status"><span class="sr-only">Loading...</span></div></div>';

    onValue(ref(db, 'addBook'), (snapshot) => {
        snapshot.forEach(element => {
            const childKey = element.key;
            const childData = element.val();
            usersData.push({ childKey, childData })
        });

        tableHead.innerHTML = ' <tr class="bg-light text-dark"><th scope="col">Sr.No.</th><th scope="col">Username</th><th scope="col">Image</th><th scope="col">Book Name</th><th scope="col">Description</th><th scope="col">Auther Name</th><th scope="col">Category</th>        <th scope="col">Language</th><th scope="col">Purchase Date</th><th scope="col">Book Condition</th><th scope="col">Price</th><th scope="col">Selling Date</th><th scope="col">Book Status</th><th scope="col">View</th></tr> ';

        tableBody.innerHTML = "";

        usersData.forEach((element, index) => {
            Data.push(element.childData)

            for (const row of Data) {
                var rowElement = document.createElement('tr');

                const no = document.createElement('td');
                no.textContent = index + 1;

                const userName = document.createElement('td');
                userName.textContent = row.userName;

                const image = document.createElement('td');
                let imgTag = document.createElement('img');
                imgTag.src = row.image;
                imgTag.width = "100";
                imgTag.height = "100";
                image.appendChild(imgTag);

                const bookName = document.createElement('td');
                bookName.textContent = row.bookName;

                const description = document.createElement('td');
                description.textContent = row.description;

                const autherName = document.createElement('td');
                autherName.textContent = row.autherName;

                const category = document.createElement('td');
                category.textContent = row.category;

                const language = document.createElement('td');
                language.textContent = row.bookLanguage;

                const purchaseDate = document.createElement('td');
                purchaseDate.textContent = row.purchaseDate;

                const bookCondition = document.createElement('td');
                bookCondition.textContent = row.bookCondition;

                const price = document.createElement('td');
                price.textContent = row.price;

                const sellingDate = document.createElement('td');
                sellingDate.textContent = Date();

                const bookStatus = document.createElement('td');
                bookStatus.textContent = "Sold";

                const buttons = document.createElement('td');
                let viewBtn = document.createElement("button");
                viewBtn.innerHTML = "<i class='fa fa-eye'></i>";
                viewBtn.type = "button";
                viewBtn.name = "viewBtn";
                viewBtn.className = "btn btn-secondary m-1 viewBtn";
                viewBtn.onclick = function () {
                    viewUser(element.childKey);
                    $("#viewBookModel").modal()
                }
                let deleteBtn = document.createElement("button");
                deleteBtn.innerHTML = "<i class='fa fa-trash'></i>";
                deleteBtn.type = "button";
                deleteBtn.name = "deleteBtn";
                deleteBtn.className = "btn btn-danger m-1 deleteBtn";
                deleteBtn.onclick = function () {
                    deleteUser(element.childKey);
                }

                buttons.appendChild(viewBtn);
                buttons.appendChild(deleteBtn);

                rowElement.appendChild(no);
                rowElement.appendChild(userName);
                rowElement.appendChild(image);
                rowElement.appendChild(bookName);
                rowElement.appendChild(description);
                rowElement.appendChild(autherName);
                rowElement.appendChild(category);
                rowElement.appendChild(language);
                rowElement.appendChild(purchaseDate);
                rowElement.appendChild(bookCondition);
                rowElement.appendChild(price);
                rowElement.appendChild(sellingDate);
                rowElement.appendChild(bookStatus);
                rowElement.appendChild(buttons);
            }
            tableBody.appendChild(rowElement);
        })
    })
}

function deleteUser(userKey) {
    if (confirm("Can you delete this user?")) {
        usersData = [];
        remove(ref(db, 'users/' + userKey))
    }
}
function viewUser(sellBookKey) {
    onValue(ref(db, 'addBook/' + sellBookKey), (snapshot) => {
        const book = snapshot.val();
        document.getElementById('muserName').innerHTML = book.userName;
        document.getElementById('muserEmail').innerHTML = book.userEmail;
        let image = document.createElement('img');
        image.src = book.image;
        image.width = "100";
        image.height = "100";
        image.alt = "...";
        document.getElementById('mimage').appendChild(image)
        document.getElementById('mbookName').innerHTML = book.bookName;
        document.getElementById('mdescription').innerHTML = book.description;
        document.getElementById('mautherName').innerHTML = book.autherName;
        document.getElementById('mcategory').innerHTML = book.category;
        document.getElementById('mlanguage').innerHTML = book.bookLanguage;
        document.getElementById('mpurchaseDate').innerHTML = book.purchaseDate;
        document.getElementById('mbookCondition').innerHTML = book.bookCondtion;
        document.getElementById('mprice').innerHTML = book.price;
        document.getElementById('msellingDate').innerHTML = "booksellingDate";
        document.getElementById('mbookStatus').innerHTML = "sold";
    })
}

