<template>
  <div>
    <h1>Todo List</h1>
    <ul>
      <li v-for="todo in todos" :key="todo.id">
        {{ todo.prenom }} doit faire : {{ todo.todo }} | {{ todo.date }}
      </li>
    </ul>
  </div>
</template>

<script>
const API_URL = import.meta.env.VITE_API_URL;
export default {
  data() {
    return {
      todos: [],
    };
  },
  created() {
    this.fetchTodos();
  },
  methods: {
    async fetchTodos() {
      try {
        const response = await fetch(API_URL + "/todos");
        console.log(response);
        const data = await response.json();
        console.log(data);
        this.todos = data;
        for (let i = 0; i < this.todos.length; i++) {
          console.log(this.todos[i].prenom);
        }
      } catch (error) {
        console.error("Error fetching todos:", error);
      }
    },
  },
};
</script>

<style scoped>
h1 {
  font-size: 2em;
  margin-bottom: 0.5em;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  background: #f9f9f9;
  margin: 0.5em 0;
  padding: 0.5em;
  border: 1px solid #ddd;
}
</style>
