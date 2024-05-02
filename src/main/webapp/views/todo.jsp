<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>To-Do App</title>
  <style>

    body {
      font-family: sans-serif;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background-color: #f5f5f5;
    }

    .container {
      background-color: #fff;
      padding: 30px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      width: 500px;
    }

    h1 {
      text-align: center;
      margin-bottom: 20px;
    }

    #todo-form {
      display: flex;
    }

    #todo-input {
      flex: 1;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px;
    }

    #todo-form button {
      padding: 10px 20px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    #todo-form button:hover {
      background-color: #3e8e41;
   }

      #todo-list {
      margin-top: 20px;
    }

    .todo-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px;
      border-bottom: 1px solid #ccc;
    }

    .todo-item input[type="checkbox"] {
      margin-right: 10px;
    }

    .todo-item label {
      flex: 1;
      font-size: 16px;
    }

    .todo-item.editing .todo-item label {
      display: none; /* Hide label when editing */
    }

    .todo-item.editing {
      position: relative;
    }

    .todo-item.editing input[type="text"] {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      padding: 5px;
      border: none;
      border-radius: 3px;
      font-size: 16px;
      display: block;
    }

    .todo-item button:first-child { /* Edit button */
      background-color: transparent;
      border: none;
      cursor: pointer;
      color: #ccc;
      transition: all 0.3s ease;
    }

    .todo-item button:first-child:hover { /* Edit button hover */
      color: #333;
    }

    .todo-item button:last-child { /* Delete button */
      background-color: transparent;
      border: none;
      cursor: pointer;
      color: #999;
      transition: all 0.3s ease;
    }

    .todo-item button:last-child:hover {
      color: red;
    }

    .completed {
      text-decoration: line-through;
      color: #ccc;
    }

    .todo-edit:hover, .todo-edit:focus {
      outline: none;
    }
  </style>
</head>

<body>
  <div class="container">
    <h1>To-Do List</h1>
    <form id="todo-form" action="/add" method="post">
      <input name="todo" type="text" id="todo-input" placeholder="Add a new task">
      <button type="submit">Add</button>
    </form>
    <div id="todo-list">
        <c:forEach var="todo" items="${todos}">
        <div class="todo-item">
         <input type="checkbox"> 
         <form action="/edit/${todo.id}" method="post"> 
         <input class="todo-edit" name="todo" value="${todo.text}" style="border: 0px; width: 100%;" 
                                                       placeholder="${todo.text}" />
           <button type="submit">Edit</button>
          </form>

          <form action="/delete/${todo.id}" method="post">
         <button type="submit">Delete</button>
          </form>
      </div>
        </c:forEach>


    </div>
  </div>
   }
</body>

</html>
