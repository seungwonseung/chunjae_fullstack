<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설문조사</title>
</head>
<body>
<div class="container">
    <h2 class="title">설문조사</h2>
    <form action="research.jsp" class="frm" method="post">
        <table class="table" id="tb1">
            <tbody>
            <tr>
                <th><label for="id">아이디</label></th>
                <td><input type="text" name="id" id="id" required autofocus></td>
            </tr>
            <tr>
                <th><label for="year">출생년도</label></th>
                <td><input type="number" name="year" id="year" min="1970" max="2023" step="1" value="2000" required></td>
            </tr>
            <tr>
                <th><label for="name">이름</label></th>
                <td><input type="text" name="name" id="name" required></td>
            </tr>
            <tr>
                <th><label>좋아하는 동물</label></th>
                <td>
                    <input type="checkbox" value="dog" name="pet" id="pet1" checked><label for="pet1">강아지</label><br>
                    <input type="checkbox" value="cat" name="pet" id="pet2"><label for="pet2">고양이</label><br>
                    <input type="checkbox" value="cow" name="pet" id="pet3"><label for="pet3">송아지</label><br>
                    <input type="checkbox" value="horse" name="pet" id="pet4"><label for="pet4">망아지</label><br>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="값 전송" class="btn btn-danger">
                    <input type="reset" value="취소" class="btn btn-primary">
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
</body>
</html>
