<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
    <title>List Customers</title>
    
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <h2>CRM - Customer Relationship Manager</h2>
        </div>
    </div>

    <div id="container">
        <div id="content">
            <input type="button" class="add-button" value="Add Customer" onclick="window.location.href = 'showFormForAdd'; return false;"/>

            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Action | Delete</th>
                </tr>

                <c:forEach items="${customers}" var="customer">
                <c:url var="updateLink" value="/customer/showFormForUpdate">
                    <c:param name="id" value="${customer.id}"/>
                </c:url>

                <c:url var="deleteLink" value="/customer/delete">
                    <c:param name="id" value="${customer.id}"/>
                </c:url>

                <tr>
                    <td>${customer.firstName}</td>
                    <td>${customer.lastName}</td>
                    <td>${customer.email}</td>
                    <td><a href="${updateLink}">Update</a> | <a href="${deleteLink}" onclick="return confirm('Are you sure tou want to delete this customer?');">Delete</a></td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>