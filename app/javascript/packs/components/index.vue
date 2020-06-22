<template>
  <div>
    <tr>
      <h4>学校名で検索</h4>
      <input type="text" v-model="keyword" placeholder="入力してください">
    </tr>
    <tr>
      <th>園の課題点</th>
      <th>対応案</th>
    </tr>
    <tr v-for="task in filteredTasks" v-bind:key="task.id">
      <td>{{ task.title }}</td>
      <td>{{task.content}}</td>
      <td><button v-on:click="deleteTask(task.id, index)">削除</button></td>
    </tr>
    <h4>追加の課題点があれば入力してください。</h4>
    <table>
      <tr>
        <th>
          <p>課題点</p>
          <textarea v-model="newTitle" placeholder="入力して下さい"></textarea>
        </th>
        <th>
          <p>対応案</p>
          <textarea v-model="newContent" placeholder="入力して下さい"></textarea><br>
        </th>
      </tr>
    </table>
      <button v-on:click="createTask">入力</button>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        keyword: '',
        tasks: [],
        newTitle: '',
        newContent: ''
      }
    },
    mounted: function () {
      this.fetchTasks();
    },
    methods: {
      fetchTasks: function () {
        axios.get('/api/tasks').then((response) => {
          for(let i = 0; i < response.data.tasks.length; i++) {
            this.tasks.push(response.data.tasks[i]);
          }
        }, (error) => {
          console.log(error, response);
        });
      },
      createTask: function () {
        if(this.newTitle == '') return;
        if(this.newContent == '') return;

        axios.post('/api/tasks', { task: { title: this.newTitle, content: this.newContent } }).then((response) => {
          this.tasks.unshift(response.data);
          this.newTitle = '';
          this.newContent = '';
        }, (error) => {
          console.log(error, response);
        });
      },
      deleteTask: function (task_id, index) {
        axios.delete('/api/tasks/' + task_id).then((response) => {
          this.tasks.splice(index, 1);
        }, (error) => {
          console.log(error, response);
        });
      },
      update: function (task_id) {
        axios.put('/api/tasks/' + task_id).then((response) => {
        }, (error) => {
          console.log(error);
        });
      }
    },
    computed: {
      filteredTasks: function() {
        var tasks = [];
        for(var i in this.tasks) {
          var task = this.tasks[i];
          if(task.title.indexOf(this.keyword) !== -1) {
            tasks.push(task);
          }
        }
        return tasks;
      }
    }
  }
</script>
