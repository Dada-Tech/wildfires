with 

source as (

    select * from {{ source('staging', 'wf_historic') }}

),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key(['fire_year', 'fire_number']) }} as fire_id,
        fire_year,
        fire_number,
        fire_name,
        current_size,
        size_class,
        fire_location_latitude,
        fire_location_longitude,
        {{ get_bq_formatted_long_lat('fire_location_longitude', 'fire_location_latitude') }} as fire_location_formatted,
        fire_origin,
        general_cause_desc,
        industry_identifier_desc,
        responsible_group_desc,
        activity_class,
        true_cause,
        fire_start_date,
        det_agent,
        det_agent_type,
        discovered_date,
        discovered_size,
        reported_date,
        dispatched_resource,
        dispatch_date,
        start_for_fire_date,
        assessment_resource,
        assessment_datetime,
        assessment_hectares,
        fire_spread_rate,
        fire_type,
        fire_position_on_slope,
        weather_conditions_over_fire,
        temperature,
        relative_humidity,
        wind_direction,
        wind_speed,
        fuel_type,
        initial_action_by,
        ia_arrival_at_fire_date,
        ia_access,
        fire_fighting_start_date,
        fire_fighting_start_size,
        bucketing_on_fire,
        distance_from_water_source,
        first_bucket_drop_date,
        bh_fs_date,
        bh_hectares,
        uc_fs_date,
        uc_hectares,
        to_fs_date,
        to_hectares,
        ex_fs_date,
        ex_hectares

    from source

)

select * from renamed
