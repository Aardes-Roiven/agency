<?php

/* @var $this yii\web\View */

$this->title = 'Агенство';
?>

<div class="site-index width">

    <div class="jumbotron text-center bg-transparent">
        <h1 class="display-4 color">Добро пожаловать!</h1>

        <?php if(Yii::$app->user->isGuest){ ?>
        <p class="marginBottom-10"><a class="btn btn-lg btn-success" href="<?=Yii::$app->urlManager->createUrl(['site/login'])?>">Авторизироваться</a></p>
        <?php } ?>
    </div>
</div>