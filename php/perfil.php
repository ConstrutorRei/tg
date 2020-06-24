<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        table {
            width: calc(100% - 20px);
            max-width: 1000px;
            margin: auto;
        }
        .profile-picture {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background-color: #CCC;
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body>
    <?php
        try
        {
            $db = new PDO('mysql:host=127.0.0.1;port=3306;dbname=tg','root','');
            $query = 'SELECT * FROM soldier';
            $stmt = $db->prepare($query);
            $stmt->execute();
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC)[0];
            print_r($data);
        } catch (Exception $e)
        {
            echo '<h1>Não foi possível conectar com o banco de dados.</h1>';
            echo '<p>' . $e->getMessage() . '</p>';
            exit();
        }
    ?>
    <table>
        <tr>
            <td rowspan="3">
                <div class="profile-picture" style="background-image: url(<?php echo $data['picture']; ?>);"></div>
            </td>
            <td>
                <h1><?php echo $data['name']; ?></h1>
            </td>
        </tr>
        <tr>
            <td>

            </td>
        </tr>
    </table>
</body>
</html>