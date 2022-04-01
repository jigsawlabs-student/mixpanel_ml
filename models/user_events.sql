with events_count as (
    select distinct_id,
    count(case when name='Visited Homepage' then 1 else 0 end) as homepage,
    count(case when name='Free Curriculum' then 1 else 0 end) as free_curriculum,
    count(case when starts_with(name, 'clicked') then 1 else 0 end) as curriculum_clicks,
    max(case when name = 'Clicked Apply' then 1 else 0 end) as label
    from mixpanel.events
    group by distinct_id
)
select * from events_count