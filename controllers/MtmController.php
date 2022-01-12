<?php

namespace app\controllers;

use app\models\MtmEmployeeDeal;
use app\models\MtmEmployeeDealSearch;
use app\controllers\AccessController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * MtmController implements the CRUD actions for MtmEmployeeDeal model.
 */
class MtmController extends AccessController
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'verbs' => [
                    'class' => VerbFilter::className(),
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
            ]
        );
    }

    /**
     * Lists all MtmEmployeeDeal models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new MtmEmployeeDealSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single MtmEmployeeDeal model.
     * @param int $deal_id Deal ID
     * @param int $employee_id Employee ID
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($deal_id, $employee_id)
    {
        return $this->render('view', [
            'model' => $this->findModel($deal_id, $employee_id),
        ]);
    }

    /**
     * Creates a new MtmEmployeeDeal model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new MtmEmployeeDeal();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'deal_id' => $model->deal_id, 'employee_id' => $model->employee_id]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing MtmEmployeeDeal model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $deal_id Deal ID
     * @param int $employee_id Employee ID
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($deal_id, $employee_id)
    {
        $model = $this->findModel($deal_id, $employee_id);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'deal_id' => $model->deal_id, 'employee_id' => $model->employee_id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing MtmEmployeeDeal model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $deal_id Deal ID
     * @param int $employee_id Employee ID
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($deal_id, $employee_id)
    {
        $this->findModel($deal_id, $employee_id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the MtmEmployeeDeal model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $deal_id Deal ID
     * @param int $employee_id Employee ID
     * @return MtmEmployeeDeal the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($deal_id, $employee_id)
    {
        if (($model = MtmEmployeeDeal::findOne(['deal_id' => $deal_id, 'employee_id' => $employee_id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
