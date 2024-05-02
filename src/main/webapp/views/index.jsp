<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Todo App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        button:hover {
            background-color: #45a049;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            padding: 10px;
            margin-bottom: 5px;
            background-color: #f9f9f9;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .btn-danger {
            background-color: #f44336;
        }

        .btn-danger:hover {
            background-color: #da190b;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Todo App</h1>
    <form action="/todo/add" method="post">
        <input type="text" name="todo" placeholder="Enter todo">
        <button type="submit">Add Todo</button>
    </form>
    
<ul id="todoList"
    <%-- Loop through todos and render todo items --%>
    <c:forEach var="todo" items="${todos}">
        <li>
            <span>${todo.text}</span>

            <form action="/todo/update/${todo.id}" method="post">
                <input type="text" name="updatedTodo" placeholder="Enter updated todo">
                <button type="submit">Update</button>
            </form>

            <form action="/todo/delete/${todo.id}" method="post">
                <button class="btn-danger" type="submit">Delete</button>
            </form>
        </li>
    </c:forEach>
</ul>
</div>

</body>
</html>
