<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:template title="Página inicial">

    <jsp:body>

        <h2 class="center">Login</h2>

        <div class="row">
            <form class="col s12 center" action="/to-do-list/inicial" method="post">
                <div class="row center">
                    <div class="input-field col offset-s3 s6">
                        <input id="username" name="username" type="text" class="validate">
                        <label for="username">Nome de usuário</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col offset-s3 s6">
                        <input id="password" name="password" type="password" class="validate">
                        <label for="password">Senha</label>
                    </div>
                </div>
                <button class="btn waves-effect waves-light">Entrar
                    <i class="material-icons right">send</i>
                </button>
            </form>
            <h3 class="center">
                <span>ou</span>
                <a href="criar-conta">
                    <button class="center btn waves-effect waves-light">Criar conta
                        <i class="material-icons right">chevron_right</i>
                    </button>
                </a>
            </h3>
        </div>

    </jsp:body>

</t:template>