function ptf_circle(size, point) =
    let(
        p_offset = -size / 2,
        p = [point[0] + p_offset[1], point[1] + p_offset[0]],
        n = max(abs(p[0]), abs(p[1])),
        r = n * 1.414,
        a = atan2(p[0], p[1])
    )
    [r * cos(a), r * sin(a)];