<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Contact</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>



</head>
<style>
    * {
        margin: 0;
        padding: 0;
        outline: 0;
        border: 0;
    }
    
    body {
        height: 100vh;
        font-family: Arial, Helvetica, sans-serif;
        display: grid;
        place-items: center;
    }
    
    h1 {
        margin-bottom: 2rem;
    }
    
    form {
        display: flex;
        flex-direction: column;
        width: 24rem;
        gap: 1rem;
    }
    
    input,
    select,
    textarea {
        padding: 1.4rem;
        background: transparent;
        border: 2px solid black;
    }
    
    button {
        width: 7rem;
        height: 2rem;
        margin-left: 30%;
        border-radius: 20%;
        cursor: pointer;
    }
</style>

<body>
    <div class="container">
        <h1>Contact Us</h1>
        <form action="https://formspree.io/f/xknylrzd" method="POST">
            <input type="text" name="Name" placeholder="Full Name" required/>
            <input type="email" name="email" placeholder="Email" required/>
            <select name="Continent">
                <option>USA</option>   
                <option>VietNam</option>  
                <option>Italy</option>  
                <option>UK</option>  
            </select>
            <Textarea name="Mesage" placeholder="Message" required></Textarea>
            <button type="submit">Send</button>
        </form>
    </div>
</body>

</html>