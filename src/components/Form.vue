<template>
  <div>
    <form @submit.prevent="submitTodo">
      <div>
        <label for="todo">Todo:</label>
        <input type="text" id="prenom" v-model="prenomText" required />
        <input type="text" id="todo" v-model="todoText" required />
        <button type="submit">Add Todo</button>
      </div>
    </form>
  </div>
</template>

<script>
const API_URL = import.meta.env.VITE_API_URL;
export default {
  data() {
    return {
      prenomText: "",
      todoText: "",
    };
  },
  methods: {
    async submitTodo() {
      try {
        const response = await fetch(API_URL + "/todos", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            prenom: this.prenomText,
            todo: this.todoText,
          }),
        });
        if (!response.ok) {
          console.log(response);
          throw new Error("Network response was not ok");
        }
        this.todoText = "";
        alert("Todo added successfully!");
      } catch (error) {
        console.error("There was a problem with the fetch operation:", error);
      }
    },
  },
};
</script>

<style scoped>
/* Add your styles here */
</style>
