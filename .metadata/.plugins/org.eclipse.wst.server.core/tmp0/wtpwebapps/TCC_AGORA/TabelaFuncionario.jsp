<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>TABELA DE FUNCIONÁRIOS</title>
      <link rel="shortcut icon" href="img/Logo_Padaria.png"/>
      <link rel="stylesheet" type="text/css" href="css/CadastroCliente.css">
   </head>
   <body>
      <jsp:include page="index.xhtml" flush="false">
         <jsp:param name="cabecalho" value="cabecalho"/>
      </jsp:include>
      <f:view>
         
         	<h2>LISTA DE FUNCIONÁRIOS</h2>
       	      
         
         <br />
         <p>
            <a href="ControlFuncionario?action">
            <img src="img/adicionar.png" style="width: 31px; height: 28px; " title="ADICIONAR" />
            </a>
         </p>
         <table border="1">
            <thead>
               <tr>
                  <th style="width: 147px; ">NOME</th>
                  <th style="width: 141px; ">SOBRENOME</th>
                  <th style="width: 126px; ">RG</th>
                  <th style="width: 147px; ">CPF</th>
                  <th style="width: 208px; height: 34px">DATA NASCIMENTO</th>
                  <th style="width: 67px; ">SEXO</th>
                  <th colspan="2" style="width: 72px; ">AÇÃO</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach items="${funcionario}" var="funcionario">
                  <tr>
                     <td>
                        <c:out value="${funcionario.nome}" />
                     </td>
                     <td>
                        <c:out value="${funcionario.sobrenome}" />
                     </td>
                     <td>
                        <c:out value="${funcionario.rg}" />
                     </td>
                     <td>
                        <c:out value="${funcionario.cpf}" />
                     </td>
                     <td>
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${funcionario.dtNasc}" />
                     </td>
                     <td>
                        <c:out value="${funcionario.sexo}" />
                     </td>
                     <td><a href='ControlFuncionario?action=Edit&idFunc=<c:out value="${funcionario.idFunc}"/>&cod=<c:out value="${funcionario.cpf}"/>'><img src="img/refresh-icon.png" style="width: 21px; height: 21px; " title="ATUALIZAR"></a></td>
                     <td><a href='ControlFuncionario?action=Delete&idFunc=<c:out value="${funcionario.idFunc}"/>&cod=<c:out value="${funcionario.cpf}"/>'><img src="img/delete.png" style="width: 21px; height: 21px; " title="EXCLUIR"></a></td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
      </f:view>
   </body>
</html>