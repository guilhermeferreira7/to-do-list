<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:template title="Criar conta">

  <jsp:body>

    <nav class="white">
      <div class="nav">
        <ul class="right">
          <li><a class="blue-text" href="/to-do-list">Voltar</a></li>
        </ul>
      </div>
    </nav>

    <h2 class="center">Criar conta</h2>

    <h4 class="center red-text">${error}</h4>

    <div class="row">
      <form class="col s12 center" action="/to-do-list/criar-conta" method="post">
        <div class="row center">
          <div class="input-field col offset-s3 s6">
            <input name="username" id="username" type="text" class="validate">
            <label for="username">Nome de usuário</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col offset-s3 s6">
            <input id="password" name="password" type="password" class="validate">
            <label for="password">Senha</label>
          </div>
        </div>
        <button class="btn waves-effect waves-light">Criar conta
          <i class="material-icons right">send</i>
        </button>
      </form>
    </div>

    <script>
      window.onload =  function (){
        $('#username').mask('Z',{translation: {'Z': {pattern: /[a-zA-Z]/, recursive: true}}});
        $("form").submit(() => {
          localStorage.setItem("login", $("#username").val());
        })
      };
    </script>

  </jsp:body>

</t:template>