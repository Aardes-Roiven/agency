<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Deal;

/**
 * DealSearch represents the model behind the search form of `app\models\Deal`.
 */
class DealSearch extends Deal
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'real_estate_obj_id', 'client_id'], 'integer'],
            [['type', 'status', 'contract_number'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Deal::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'real_estate_obj_id' => $this->real_estate_obj_id,
            'client_id' => $this->client_id,
        ]);

        $query->andFilterWhere(['ilike', 'type', $this->type])
            ->andFilterWhere(['ilike', 'status', $this->status])
            ->andFilterWhere(['ilike', 'contract_number', $this->contract_number]);

        return $dataProvider;
    }
}
