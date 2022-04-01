{{
    config(
        materialized='model',
        ml_config={
            'model_type': 'logistic_reg',
            'early_stop': true,
            'ls_init_learn_rate': 2
        }
    )
}}
select homepage, free_curriculum, curriculum_clicks, label from {{ ref('train_user_events') }}