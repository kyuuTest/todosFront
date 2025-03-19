<template>
    <div>
        <form @submit.prevent="submitTodo">
            <div>
                <label for="todo">Todo:</label>
                <input type="text" id="todo" v-model="todoText" required />
                <button type="submit">Add Todo</button>
            </div>
        </form>
    </div>
</template>

<script>
export default {
    data() {
        return {
            todoText: ''
        };
    },
    methods: {
        async submitTodo() {
            try {
                const response = await fetch('http://localhost:3000/addTodo', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ text: this.todoText })
                });
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                this.todoText = '';
                alert('Todo added successfully!');
            } catch (error) {
                console.error('There was a problem with the fetch operation:', error);
            }
        }
    }
};
</script>

<style scoped>
/* Add your styles here */
</style>