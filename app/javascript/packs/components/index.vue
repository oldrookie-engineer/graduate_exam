<template>
  <div>
    <div class="searching">
      <h6>幼 稚 園 名 で 検 索<br>(部 分 検 索 も 可)</h6>
      <input type="text" v-model="keyword" placeholder="入力して下さい">
    </div>
    <table class="table table-hover">
    <tr>
      <th class="table-success">幼 稚 園 名</th>
      <th class="table-success">課 題 点</th>
      <th class="table-success">対 応 案</th>
      <th colspan=1 class="table-success">対 応 状 況</th>
      <th class="table-success">削 除</th>
    </tr>
    <tr v-for="task in filteredTasks" v-bind:key="task.id">
      <td><span v-bind:class="{done: task.isDone}">{{ task.name }}幼稚園</span></td>
      <td><span v-bind:class="{done: task.isDone}">{{ task.title }}</span></td>
      <td><span v-bind:class="{done: task.isDone}">{{ task.content }}</span></td>
      <td><input type="checkbox" v-model="task.isDone" v-on:click="update(task.id, index)"></td>
      <td><button v-on:click="deleteTask(task.id, index)">🗑</button></td>
    </tr>
    </table><br>
    <h5>追加の課題点等があれば入力してください。</h5><br>
    <table class="table">
      <tr class="memo">
        <th>
          <p>幼 稚 園 名</p>
          <input type="text" v-model="newName" placeholder="入力して下さい"> 幼 稚 園
        </th>
        <th>
          <p>課 題 点</p>
          <textarea v-model="newTitle" placeholder="入力して下さい" :rows="rows"></textarea>
        </th>
        <th>
          <p>対 応 案</p>
          <textarea v-model="newContent" placeholder="入力して下さい" :rows="rows"></textarea><br>
        </th>
      </tr>
    </table>
      <button v-on:click="createTask"  variant="danger" class="btn btn-info">入 力</button>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        keyword: '',
        tasks: [],
        newName: '',
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
        if(this.newName == '') {
          alert('幼稚園名の入力欄が空欄です！');
          return;
        } else if(this.newTitle == '') {
          alert('課題点の入力欄が空欄です！');
          return;
        } else if(this.newContent == '') {
          alert('対応案の入力欄が空欄です！');
          return;
        }
        axios.post('/api/tasks', { task: { name: this.newName, title: this.newTitle, content: this.newContent } }).then((response) => {
          this.tasks.unshift(response.data);
          this.newName = '';
          this.newTitle = '';
          this.newContent = '';
        }, (error) => {
          console.log(error, response);
        });
      },
      deleteTask: function (task_id, index) {
        axios.delete('/api/tasks/' + task_id).then((response) => {
          if(confirm('本当に削除していいですか？')) {
            this.tasks.splice(index, 1);
          }
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
          if(task.name.indexOf(this.keyword) !== -1) {
            tasks.push(task);
          }
        }
        return tasks;
      },
      rows: function() {
        var num = this.newTitle.split("\n").length;
        return (num > 4) ? num :4;
        this.newContent.split("\n").length;
        return (num > 4) ? num :4;
      }
    }
  }
</script>

<style>
  .searching {
    margin-bottom: 20px;
  }

  .searching h6 {
    font-weight: bold;
  }

  .searching input {
    border-radius: 5px;
    padding: 5px;
    text-align: center;
  }

  .memo input {
    border-radius: 5px;
    padding: 5px;
    text-align: center;
  }

  .memo textarea {
    border-radius: 5px;
    padding: 5px;
  }
</style>
