<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:template title="Página inicial">

  <jsp:body>
    <nav class="white">
      <div class="nav">
        <ul class="right">
          <li><a class="blue-text" href="nova-tarefa">Adicionar tarefa</a></li>
          <li><a class="blue-text" href="tarefas-concluidas">Tarefas concluidas</a></li>
          <li><a class="blue-text" href="logout" id="logout">Logout</a></li>
        </ul>
      </div>
    </nav>

    <h2 class="center">Minhas tarefas</h2>

    <p class="center" id="username"></p>

    <p class="center">Total de tarefas adicionadas por todos os usuários no escopo de aplicativo: ${tasksCounter}</p>

    <div class="row center">
      <c:if test="${empty tasks}">
        <h4 class="center">Nenhuma tarefa adicionada</h4>
      </c:if>

      <c:if test="${not empty tasks}">
        <table class="highlight centered col offset-s2 s8">
          <thead>
          <tr>
            <th>Tarefa</th>
            <th>Observações</th>
            <th>Data de criação</th>
            <th>Marcar como concluída</th>
          </tr>
          </thead>

          <tbody>
            <c:forEach var="task" items="${tasks}">
              <tr>
                <td>${task.taskName}</td>
                <td>${task.description}</td>
                <td>${task.dataCreated}</td>
                <td>
                  <button id="${task.id}" class="completeTask" class="center btn btn-small waves-effect waves-light">
                    <i class="material-icons">check</i>
                  </button>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:if>

    </div>

    <script>
      window.onload =  function (){
        const userLogin = localStorage.getItem("login");
        const h4 = "<h4>Bem vindo de volta " + userLogin + " </h4>";
        $("#username").append(h4)

        $(".completeTask").click(function () {
          const params = {
            id: $(this).attr("id")
          }

          const res = confirm("Quer mesmo marcar como concluída?");
          if (res) {
            $.post('tarefas-concluidas', $.param(params))
          }
        })

        $("#logout").click(() => {
          localStorage.clear();
        })
      }
    </script>

  </jsp:body>

</t:template>