package com.todo.todoapp;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.List;


@Controller
public class TodoController {

  private final TodoRepository todoRepository;

  public TodoController(TodoRepository todoRepository) {
    this.todoRepository = todoRepository;
  }

  private List<Todo> getAllTodos() {
    return todoRepository.findAll();
  }

  @RequestMapping("/")
  public String getTodo(Model model) {
    model.addAttribute("todos", getAllTodos());
    return "todo";
  }

  @PostMapping("/add")
  public String addTodo(@ModelAttribute TodoDto todo) {
    todoRepository.save(new Todo(todo.todo()));
    return "redirect:/";
  }

  @RequestMapping(method = RequestMethod.POST, value = "/delete/{id}")
  public String deleteTodo(@PathVariable(name = "id") Long id) {
    todoRepository.deleteById(id);
    return "redirect:/";
  }

  @RequestMapping(method = RequestMethod.POST, value = "/edit/{id}")
  public String editTodo(@PathVariable(name = "id") Long id, @ModelAttribute TodoDto edit) {
    Todo newTodo = new Todo(id, edit.todo());
    todoRepository.save(newTodo);
    return "redirect:/";
  }
}
