<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>PEDIDO DE COMPRA</title> 
      <link rel="shortcut icon" href="img/Logo_Padaria.png"/>
      <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
   </head>
   <body>
      <jsp:include page="index.xhtml" flush="false">
         <jsp:param name="cabecalho" value="cabecalho"/>
      </jsp:include>
   
  <f:view >  
         <form action="ControlCompra" method="POST" name="cadastroCompra">
            
            	<h2>PEDIDO COMPRA</h2>
           
            <br />
            <p>
            	<input value="ENVIAR" type="submit" id="btn"> <a href="ControlCompra?action=Tabela">CANCELAR</a> 
            </p>
            <br />
            <fieldset id="informacoes"> 
               <p>
                  <label>
                     REFERÊCIA: <input readonly="readonly" value="<c:out value="COMPRA/${compra.idCompra}"/>"/> 
                  </label>
                  <label>
                     DATA COMPRA: <input name="dataCompra" readonly="readonly" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${compra.dataCriada}" />"  style="width: 100px; "/>
                  </label>
               </p> 
               <p> 
                  <label>
                     SITUAÇÃO: <input readonly="readonly" value="<c:out value="${compra.status}"/>" /> 
                  </label>
                  <label>
                     DATA FINALIZADA: <input name="dataFinalizada" readonly="readonly"  value="<fmt:formatDate pattern="dd/MM/yyyy" value="${compra.dataFinalizada}" />" style="width: 100px; "/>
                  </label>
               </p>
                
            	 <br />
            		<table border="1">
            			<thead>
            				<tr> 
            					<th style="width: 193px; " >PRODUTO</th>
            					<th style="width: 195px; ">FORNECEDOR</th>
            					<th style="width: 125px; ">QUANTIDADE</th>
            					<th style="width: 154px; ">VALOR UNITÁRIO</th>
            					<th style="width: 94px; ">SUBTOTAL</th>
            					<th colspan="2">AÇÃO</th>
            				</tr>
            			</thead>
            			<tbody>
            				<c:forEach items="${itens}" var="itens">
            					<tr>
            						<td> 
            							<c:out value="${itens.tbProduto.nomeProduto}"></c:out>
           							</td> 
           							<td>
           							 	<c:out value="${itens.tbProduto.tbFornecedore.razaoSocial}"></c:out>
           							</td>
									<td contenteditable="true" align="center">
            							<c:out value="${itens.quantidade}" />
           							</td>
           							<td contenteditable="true" align="center">
            							<c:out value="${itens.tbProduto.valorUniCompra}" />
           							</td>
           							<td id="subtotal"  >
            							<c:out value="${itens.quantidade}*${itens.tbProduto.valorUniCompra}" />
            						 
           							</td>
            						<td><a href='ControlEstabelecimento?action=Edit&idCompra=<c:out value=" "/>&cod=<c:out value=" "/>'><img src="img/refresh-icon.png" style="width: 21px; height: 21px; " title="ATUALIZAR"></a></td>
                 					<td><a href='ControlEstabelecimento?action=Delete&idCompra=<c:out value=" "/>&cod=<c:out value=" "/>'><img src="img/delete.png" style="width: 21px; height: 21px; " title="EXCLUIR"></a></td>
                 
            					</tr>
            				</c:forEach>
            				 	<tr>
	            					<td colspan="7">
	            						<a href="#">INSERIR ITENS</a>
	            					</td>
	            				</tr>	
	            				<tr><td colspan="7" style="color: white">  0  </td> </tr>
	            			 	<tr>	
	            			 		<td colspan="4">TOTAL</td>
	            			 		<td colspan="3">R$ XXX,XX</td>
            					</tr> 
            			</tbody>
            		</table>
            </fieldset>
         </form>
   </f:view>
   </body>  
</html>	