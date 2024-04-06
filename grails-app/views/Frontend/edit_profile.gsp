<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit profile</title>
    <link rel="stylesheet" href="${assetPath(src: 'Login.css')}" type="text/css">
    <link rel="stylesheet" href="${assetPath(src: 'edit_profile.css')}" type="text/css">
</head>
<body>

    <div class="navbar" style="justify-content: space-evenly;">
        <div>
            <a href="#" class="nav-link">
                <h3>Link Sharing</h3>
            </a>
        </div>
        <div class="search-container">
            <span class="search-icon">&#128269;</span>
            <input type="text" class="search-input" placeholder="Search...">
            <span class="close-icon">&#10005;</span>
        </div>
        <div class="clogo">
            <img src="${assetPath(src: 'chat-fill.svg')}" alt="chat-fill" onclick="showCard(1)">
            <img src="${assetPath(src: 'envelope.svg')}" alt="envelope" onclick="showCard(2)">
            <img src="${assetPath(src: 'link.svg')}" alt="link" onclick="showCard(3)">
            <img src="${assetPath(src: 'file-earmark-fill.svg')}" alt="file-earmark-fill" onclick="showCard(4)">
        </div>
        <div class="dprofile">
            <img src="${assetPath(src: 'person-fill.svg')}" alt="person-fill" style="height: 30px; width: 30px; padding-top: 6px;">  
            <div class="dropdown">
                <button class="dropbtn nbtn">Dropdown
                    <img src="/Img/caret-down-fill.svg" alt="">
                </button>
                <div class="dropdown-content">
    <g:link controller="Profile">Profile</g:link>
    <g:link controller="user">User</g:link>
    <g:link controller="topic">Topic</g:link>
    <g:link controller="post">Post</g:link>
    <g:link controller="logout">Logout</g:link>
                </div>
            </div>
        </div>
    </div>

<div class="Parent">
    <div class="lft">
        <div class="userCard">
            <div class="userImg">
                    <img src="${assetPath(src: 'person-circle.svg')}" alt="person-circle.svg"  height="90px" width="90px">
            </div>
            <div class="userData">
                <h2 id="userName">Loading Name..</h2>
                <p id="userEmail"> User Email...</p>
                <div class="userS">
                    <div class="S">
                        <p>Subscription</p>
                        <p>50</p>
                    </div>
                    <div class="T">
                        <p>Topics</p>
                        <p>50</p>
                    </div>
                </div>
            </div>
            </div>
            <div class="Dsubscription">
                <div class="hSub">
                    <p>Subscription</p>
                    <a href="#" style="padding-top: 13px; padding-right: 12px;"> View All</a>
                </div>
                <div class="Border1" style="border: 2px solid black;">
                    <div class="DSubcontent">
                        <div class="userCard" style="border: 0cap;">
                            <div class="userImg">
                    <img src="${assetPath(src: 'person-circle.svg')}" alt="person-circle.svg"  height="90px" width="90px">
                            </div>
                            <div class="userData">
                                <h2>Uday Pratap Singh</h2>
                                <div class="userS">
                                    <div class="DId">
                                        <p>@uday</p>
                                        <a href="#">Unsubscribed</a>
                                    </div>
                                    <div class="S">
                                        <p>Subscription</p>
                                        <p>50</p>
                                    </div>
                                    <div class="T">
                                        <p>Topics</p>
                                        <p>50</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="SubInfo">
                        <select id="dropdown-menu">
                            <option value="" disabled selected>Serious</option>
                            <option value="option1">Option 1</option>
                            <option value="option2">Option 2</option>
                            <option value="option3">Option 3</option>
                        </select>
                        <select id="dropdown-menu">
                            <option value="" disabled selected>Private</option>
                            <option value="option1">Option 1</option>
                            <option value="option2">Option 2</option>
                            <option value="option3">Option 3</option>
                        </select>
                         <img src="${assetPath(src: 'envelope.svg')}" alt="envelope" style="margin-left: 40px;">
                         <img src="${assetPath(src: 'link.svg')}" alt="link" >
                         <img src="${assetPath(src: 'trash-fill.svg')}" alt="trash-fill">
                    </div>
                </div>
            </div>
            
    </div>
    <div class="rgt">

        <div class="Profile">
            <div class="Profile1"><h4>Profile</h4></div>
            <g:form id="profile_update"  controller="Profile" action="change_profile">
            <div class="cProfile">
                 <div class="name">
                    <p>First name*</p>
                    <input type="text" id="fname" name="firstName" placeholder="Your name.." style="margin-right: 3%;" value="${session.user.firstName}">
                 </div>
                 <div class="name">
                    <p>Last name*</p>
                    <input type="text" id="lname" name="lastName" placeholder="Your Last name.." style="margin-right: 3%;"value="${session.user.lastName}">
                 </div>
                 <div class="name">
                    <p>User name*</p>
                    <input type="text" id="user_name" name="username" placeholder="Your User name.." style="margin-right: 3%;" value="${session.user.username}">
                 </div>
                 <div class="name">
                    <p>Image</p>
                    <div class="form-group">
                        <input type="file" id="imageInput" accept="image/png, image/jpeg" value="${session?.user?.photo}" name="photo" >
                        <img id="previewImage" alt="Preview Image" style="display: none;">
                    </div>
                 </div>
                 <div class="name">
                    <p></p>
                    <button style="margin-right: 30%; " type="submit">Update</button>
                 </div>
            </div>
            </g:form>
        </div>


        <div class="Profile" style="margin-top: 4%;">
            <div class="Profile1"><h4>Change Password</h4></div>
<g:form id="passwordForm" controller="Profile" action="change_pass">
    <div class="cProfile">
        <div class="name">
            <p>Password*</p>
            <input type="password" id="pass" name="password" placeholder="Your Password.." style="margin-right: 3%;">
        </div>
        <div class="name">
            <p>Confirm Password*</p>
            <input type="password" id="cpass" name="Confirm_Password" placeholder="Your Confirm Password.." style="margin-right: 3%;">
            <p id="passwordError" style="color: red; display: none;">Passwords do not match.</p>
        </div>
        <div class="name">
            <p></p>
            <button id="updateButton" style="margin-right: 30%; margin-bottom: 3%;">Update</button>
        </div>
    </div>
</g:form>

        </div>
    </div>
</div>






</body>
<asset:javascript src="script.js"/>

<script>
 
 var userId = localStorage.getItem('userId');

 fetch('${createLink(controller: "User", action:"details")}?userId=' + userId)
     .then(response =>response.json())
     .then(user =>{
        document.getElementById('userName').textContent = user.username;
        document.getElementById('userEmail').textContent = user.email;
     })
     .catch(error =>{
        console.error('Data is not extracted, Error', error);
     });



 const passInput = document.getElementById('pass');
    const cpassInput = document.getElementById('cpass');
    const updateButton = document.getElementById('updateButton');
    const passwordForm = document.getElementById('passwordForm');
    const passwordError = document.getElementById('passwordError');

    // Function to check if passwords match
    function checkPasswordMatch() {
        if (passInput.value !== cpassInput.value) {
            passwordError.style.display = 'block';
            updateButton.disabled = true;
        } else {
            passwordError.style.display = 'none';
            updateButton.disabled = false;
        }
    }

    // Add event listener to confirm password input
    cpassInput.addEventListener('input', checkPasswordMatch);

    // Add event listener to Update button
    updateButton.addEventListener('click', function() {
        if (passInput.value === cpassInput.value) {
            // Submit the form if passwords match
            passwordForm.submit();
        }
    });


</script >
</html>