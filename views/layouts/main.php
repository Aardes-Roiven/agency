<?php

/* @var $this View */
/* @var $content string */

use app\assets\AppAsset;
use app\widgets\Alert;
use yii\bootstrap4\Breadcrumbs;
use yii\bootstrap4\Html;
use yii\bootstrap4\Nav;
use yii\bootstrap4\NavBar;
use yii\web\View;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" class="h-100">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body class="d-flex flex-column h-100 ">
<?php $this->beginBody() ?>
<header>
    <?php
    NavBar::begin([
//        'brandLabel' => Yii::$app->name,
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar navbar-expand-md navbar-dark bg-dark fixed-top ',
        ],
    ]);
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-nav-c'],
        'items' => [
            ['label' => 'Агенство', 'url' => ['/site/index']],
            ['label' => 'Клиенты', 'url' => ['/client/index']],
            ['label' => 'Сделки', 'url' => ['/deal/index']],
            ['label' => 'Сотрудники', 'url' => ['/employee/index']],
            ['label' => 'Застройщики', 'url' => ['/dev/index']],
            ['label' => 'Комплексы', 'url' => ['/complex/index']],
            ['label' => 'Здания', 'url' => ['/building/index']],
            ['label' => 'Товары', 'url' => ['/object/index']],
            ['label' => 'Должности', 'url' => ['/position/index']],
            ['label' => 'Сотрудники и сделки', 'url' => ['/mtm/index']],

            Yii::$app->user->isGuest ? (
                ['label' => 'Войти', 'url' => ['/site/login']]
            ) : (
                '<li>'
                . Html::beginForm(['/site/logout'], 'post', ['class' => 'form-inline'])
                . Html::submitButton(
                    'Выйти',
                    ['class' => 'btn btn-link logout']
                )
                . Html::endForm()
                . '</li>'
            )
        ],
    ]);
    NavBar::end();
    ?>
</header>
<main role="main" class="flex-shrink-0">
    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</main>

<footer class="footer mt-auto py-3 text-muted">
    <div class="container">
        <p class="float-left">&copy; My Company <?= date('Y') ?></p>
        <p class="float-right"><?= Yii::powered() ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
