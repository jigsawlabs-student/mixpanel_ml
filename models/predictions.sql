{{
    config(
        materialized='table'
    )
}}

with predict_features as (
    select homepage, free_curriculum, curriculum_clicks, label
    from {{ ref('test_user_events')}}
)

select * from {{ dbt_ml.predict(ref('log_model'), 'predict_features') }}
