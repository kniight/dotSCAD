module test_cross_sections() {
    echo("==== test_cross_sections ====");

    include <unittest.scad>;
    include <polysections.scad>;
    include <cross_sections.scad>;
    include <archimedean_spiral.scad>;
    include <rotate_p.scad>;

    shape_pts = [
        [-2, -10],
        [-2, 10],
        [2, 10],
        [2, -10]
    ];

    pts_angles = archimedean_spiral(
        arm_distance = 20,
        init_angle = 180,
        point_distance = 5,
        num_of_points = 100 
    ); 

    pts = [for(pt_angle = pts_angles) pt_angle[0]];
    angles = [
        for(i = [0:len(pts_angles) - 1]) [90, 0, pts_angles[i][1]]
    ];  

    expected = [
    [[-8, 0, -10], [-8, 0, 10], [-12, 0, 10], [-12, 0, -10]]
    ,[[-8.6994, -4.8132, -9.967], [-8.1492, -4.5088, 9.8412], [-11.6157, -6.4267, 9.967], [-12.1659, -6.7311, -9.8412]]
    ,[[-6.878, -9.4072, -9.923], [-6.143, -8.4019, 9.6739], [-8.4562, -11.5658, 9.923], [-9.1913, -12.5711, -9.6739]]
    ,[[-3.1918, -12.8199, -9.8682], [-2.745, -11.0255, 9.4983], [-3.6808, -14.784, 9.8682], [-4.1275, -16.5785, -9.4983]]
    ,[[1.5997, -14.5687, -9.8028], [1.3334, -12.1435, 9.3149], [1.7507, -15.9442, 9.8028], [2.017, -18.3694, -9.3149]]
    ,[[6.7711, -14.5108, -9.7272], [5.4956, -11.7773, 9.1239], [7.0899, -15.1939, 9.7272], [8.3654, -17.9273, -9.1239]]
    ,[[11.6997, -12.74, -9.6415], [9.2792, -10.1043, 8.9258], [11.791, -12.8394, 9.6415], [14.2115, -15.4751, -8.9258]]
    ,[[15.8948, -9.5061, -9.5462], [12.3539, -7.3884, 8.721], [15.4894, -9.2636, 9.5462], [19.0303, -11.3813, -8.721]]
    ,[[19.0056, -5.1511, -9.4413], [14.5101, -3.9327, 8.5098], [17.9753, -4.8719, 9.4413], [22.4707, -6.0903, -8.5098]]
    ,[[20.8154, -0.0611, -9.3273], [15.6418, -0.0459, 8.2925], [19.1657, -0.0562, 9.3273], [24.3394, -0.0714, -8.2925]]
    ,[[21.2291, 5.3718, -9.2043], [15.7291, 3.9801, 8.0697], [19.0783, 4.8276, 9.2043], [24.5783, 6.2193, -8.0697]]
    ,[[20.2549, 10.776, -9.0729], [14.8199, 7.8845, 7.8416], [17.8064, 9.4734, 9.0729], [23.2414, 12.3649, -7.8416]]
    ,[[17.986, 15.8198, -8.9331], [13.0134, 11.4461, 7.6087], [15.4976, 13.6311, 8.9331], [20.4701, 18.0048, -7.6087]]
    ,[[14.5805, 20.2234, -8.7855], [10.4452, 14.4877, 7.3713], [12.335, 17.1089, 8.7855], [16.4703, 22.8446, -7.3713]]
    ,[[10.2434, 23.766, -8.6303], [7.2741, 16.8768, 7.1299], [8.5217, 19.7714, 8.6303], [11.4911, 26.6606, -7.1299]]
    ,[[5.2094, 26.2883, -8.4678], [3.6709, 18.5244, 6.8848], [4.2677, 21.5364, 8.4678], [5.8063, 29.3002, -6.8848]]
    ,[[-0.2725, 27.6913, -8.2984], [-0.1907, 19.3821, 6.6365], [-0.2201, 22.369, 8.2984], [-0.3019, 30.6781, -6.6365]]
    ,[[-5.9515, 27.9334, -8.1224], [-4.1415, 19.4382, 6.3853], [-4.7462, 22.2761, 8.1224], [-6.5562, 30.7712, -6.3853]]
    ,[[-11.5863, 27.0248, -7.9403], [-8.0228, 18.713, 6.1316], [-9.1318, 21.2997, 7.9403], [-12.6953, 29.6115, -6.1316]]
    ,[[-16.9534, 25.0213, -7.7523], [-11.6906, 17.2541, 5.8758], [-13.2195, 19.5105, 7.7523], [-18.4823, 27.2778, -5.8758]]
    ,[[-21.8538, 22.017, -7.5588], [-15.0189, 15.1311, 5.6184], [-16.8755, 17.0015, 7.5588], [-23.7104, 23.8874, -5.6184]]
    ,[[-26.1178, 18.1367, -7.3602], [-17.9016, 12.4312, 5.3596], [-19.9911, 13.8822, 7.3602], [-28.2073, 19.5877, -5.3596]]
    ,[[-29.608, 13.5285, -7.1568], [-20.2537, 9.2543, 5.0999], [-22.4833, 10.2731, 7.1568], [-31.8377, 14.5473, -5.0999]]
    ,[[-32.2209, 8.3567, -6.9491], [-22.0116, 5.7089, 4.8397], [-24.2938, 6.3008, 6.9491], [-34.5031, 8.9486, -4.8397]]
    ,[[-33.8866, 2.7944, -6.7373], [-23.1328, 1.9076, 4.5793], [-25.3884, 2.0936, 6.7373], [-36.1423, 2.9804, -4.5793]]
    ,[[-34.5686, -2.9822, -6.5219], [-23.595, -2.0355, 4.3191], [-25.7552, -2.2219, 6.5219], [-36.7288, -3.1685, -4.3191]]
    ,[[-34.2616, -8.7996, -6.3033], [-23.3951, -6.0087, 4.0594], [-25.4025, -6.5243, 6.3033], [-36.269, -9.3152, -4.0594]]
    ,[[-32.989, -14.492, -6.0817], [-22.5472, -9.9049, 3.8007], [-24.3567, -10.6998, 6.0817], [-34.7986, -15.2869, -3.8007]]
    ,[[-30.7999, -19.9048, -5.8576], [-21.0812, -13.624, 3.5433], [-22.6603, -14.6445, 5.8576], [-32.3791, -20.9253, -3.5433]]
    ,[[-27.766, -24.8987, -5.6314], [-19.0409, -17.0746, 3.2875], [-20.3689, -18.2655, 5.6314], [-29.094, -26.0896, -3.2875]]
    ,[[-23.9774, -29.3515, -5.4034], [-16.4816, -20.1756, 3.0338], [-17.5491, -21.4824, 5.4034], [-25.0449, -30.6583, -3.0338]]
    ,[[-19.5393, -33.1603, -5.174], [-13.4683, -22.8572, 2.7823], [-14.2762, -24.2281, 5.174], [-20.3472, -34.5313, -2.7823]]
    ,[[-14.5684, -36.2426, -4.9436], [-10.0739, -25.0615, 2.5334], [-10.6316, -26.449, 4.9436], [-15.1261, -37.6301, -2.5334]]
    ,[[-9.1885, -38.5369, -4.7124], [-6.3765, -26.7431, 2.2876], [-6.7012, -28.1049, 4.7124], [-9.5132, -39.8987, -2.2876]]
    ,[[-3.5281, -40.0022, -4.481], [-2.458, -27.8692, 2.045], [-2.5727, -29.1693, 4.481], [-3.6428, -41.3023, -2.045]]
    ,[[2.2837, -40.6181, -4.2495], [1.5978, -28.4193, 1.8059], [1.6658, -29.6285, 4.2495], [2.3516, -41.8273, -1.8059]]
    ,[[8.1196, -40.3838, -4.0185], [5.7071, -28.3853, 1.5707], [5.9275, -29.4812, 4.0185], [8.3399, -41.4797, -1.5707]]
    ,[[13.857, -39.3164, -3.7881], [9.7877, -27.7704, 1.3397], [10.1286, -28.7377, 3.7881], [14.1979, -40.2837, -1.3397]]
    ,[[19.3804, -37.4498, -3.5589], [13.7599, -26.5891, 1.1131], [14.1894, -27.4189, 3.5589], [19.8098, -38.2796, -1.1131]]
    ,[[24.5828, -34.8326, -3.331], [17.5487, -24.8656, 0.8912], [18.0357, -25.5555, 3.331], [25.0697, -35.5225, -0.8912]]
    ,[[29.3681, -31.5265, -3.1048], [21.0842, -22.6338, 0.6742], [21.5994, -23.1868, 3.1048], [29.8833, -32.0795, -0.6742]]
    ,[[33.6516, -27.6041, -2.8807], [24.3027, -19.9353, 0.4623], [24.8196, -20.3593, 2.8807], [34.1685, -28.0282, -0.4623]]
    ,[[37.3613, -23.147, -2.6589], [27.1475, -16.8191, 0.2559], [27.6431, -17.1261, 2.6589], [37.8568, -23.454, -0.2559]]
    ,[[40.4386, -18.2435, -2.4398], [29.5699, -13.3402, 0.0551], [30.0247, -13.5454, 2.4398], [40.8934, -18.4487, -0.0551]]
    ,[[42.8383, -12.9867, -2.2237], [31.5289, -9.5581, -0.1399], [31.9277, -9.6791, 2.2237], [43.2372, -13.1076, 0.1399]]
    ,[[44.5289, -7.4725, -2.0107], [32.9923, -5.5365, -0.3288], [33.3241, -5.5922, 2.0107], [44.8606, -7.5282, 0.3288]]
    ,[[45.4921, -1.798, -1.8013], [33.9365, -1.3413, -0.5116], [34.1942, -1.3515, 1.8013], [45.7499, -1.8082, 0.5116]]
    ,[[45.7227, 3.9407, -1.5957], [34.3463, 2.9602, -0.688], [34.5272, 2.9758, 1.5957], [45.9035, 3.9563, 0.688]]
    ,[[45.2275, 9.6496, -1.3942], [34.2154, 7.3001, -0.8578], [34.3203, 7.3224, 1.3942], [45.3324, 9.6719, 0.8578]]
    ,[[44.0252, 15.2385, -1.1969], [33.5457, 11.6112, -1.021], [33.5789, 11.6228, 1.1969], [44.0584, 15.25, 1.021]]
    ,[[42.1447, 20.6225, -1.0042], [32.3471, 15.8282, -1.1773], [32.316, 15.813, 1.0042], [42.1136, 20.6072, 1.1773]]
    ,[[39.6247, 25.7223, -0.8163], [30.6371, 19.888, -1.3267], [30.5515, 19.8324, 0.8163], [39.539, 25.6667, 1.3267]]
    ,[[36.5121, 30.4659, -0.6334], [28.4406, 23.731, -1.4691], [28.3123, 23.6239, 0.6334], [36.3838, 30.3588, 1.4691]]
    ,[[32.8613, 34.789, -0.4556], [25.7887, 27.3015, -1.6043], [25.6309, 27.1345, 0.4556], [32.7036, 34.622, 1.6043]]
    ,[[28.7328, 38.6357, -0.2833], [22.7186, 30.5487, -1.7323], [22.5456, 30.3161, 0.2833], [28.5598, 38.4031, 1.7323]]
    ,[[24.1916, 41.9585, -0.1166], [19.2726, 33.4269, -1.853], [19.0992, 33.126, 0.1166], [24.0181, 41.6576, 1.853]]
    ,[[19.3069, 44.7191, 0.0444], [15.4977, 35.8962, -1.9664], [15.3383, 35.5269, -0.0444], [19.1474, 44.3498, 1.9664]]
    ,[[14.15, 46.888, 0.1995], [11.4444, 37.9227, -2.0724], [11.3131, 37.4877, -0.1995], [14.0187, 46.4531, 2.0724]]
    ,[[8.7938, 48.4451, 0.3484], [7.1663, 39.4789, -2.171], [7.0763, 38.9831, -0.3484], [8.7038, 47.9493, 2.171]]
    ,[[3.3117, 49.3785, 0.4912], [2.7191, 40.5438, -2.2621], [2.6823, 39.9944, -0.4912], [3.2748, 48.8291, 2.2621]]
    ,[[-2.224, 49.6854, 0.6276], [-1.8398, 41.1031, -2.3458], [-1.8132, 40.5091, -0.6276], [-2.1974, 49.0914, 2.3458]]
    ,[[-7.7421, 49.371, 0.7575], [-6.4528, 41.149, -2.422], [-6.3543, 40.5208, -0.7575], [-7.6436, 48.7427, 2.422]]
    ,[[-13.1742, 48.4479, 0.8809], [-11.062, 40.6803, -2.4908], [-10.8851, 40.0296, -0.8809], [-12.9973, 47.7972, 2.4908]]
    ,[[-18.4549, 46.9363, 0.9976], [-15.6105, 39.7022, -2.5523], [-15.3507, 39.0414, -0.9976], [-18.1951, 46.2755, 2.5523]]
    ,[[-23.5227, 44.8627, 1.1076], [-20.0428, 38.2259, -2.6064], [-19.6979, 37.568, -1.1076], [-23.1777, 44.2048, 2.6064]]
    ,[[-28.3204, 42.2597, 1.2108], [-24.3055, 36.2687, -2.6532], [-23.8753, 35.6268, -1.2108], [-27.8902, 41.6178, 2.6532]]
    ,[[-32.7959, 39.1652, 1.3072], [-28.3479, 33.8534, -2.6928], [-27.8343, 33.24, -1.3072], [-32.2823, 38.5518, 2.6928]]
    ,[[-36.9023, 35.6215, 1.3966], [-32.1226, 31.0077, -2.7253], [-31.5294, 30.4351, -1.3966], [-36.3092, 35.049, 2.7253]]
    ,[[-40.5983, 31.6749, 1.4792], [-35.5857, 27.764, -2.7507], [-34.9187, 27.2436, -1.4792], [-39.9313, 31.1545, 2.7507]]
    ,[[-43.8484, 27.3749, 1.5548], [-38.6975, 24.1592, -2.7693], [-37.964, 23.7012, -1.5548], [-43.1149, 26.9169, 2.7693]]
    ,[[-46.6232, 22.7734, 1.6235], [-41.423, 20.2334, -2.781], [-40.6315, 19.8467, -1.6235], [-45.8317, 22.3868, 2.781]]
    ,[[-48.899, 17.9242, 1.6852], [-43.7316, 16.03, -2.786], [-42.892, 15.7223, -1.6852], [-48.0594, 17.6164, 2.786]]
    ,[[-50.6584, 12.882, 1.7401], [-45.5979, 11.5952, -2.7844], [-44.7209, 11.3722, -1.7401], [-49.7814, 12.659, 2.7844]]
    ,[[-51.8898, 7.7023, 1.7881], [-47.0015, 6.9767, -2.7764], [-46.0985, 6.8427, -1.7881], [-50.9868, 7.5683, 2.7764]]
    ,[[-52.5874, 2.4402, 1.8292], [-47.9275, 2.224, -2.7622], [-47.0102, 2.1814, -1.8292], [-51.6701, 2.3977, 2.7622]]
    ,[[-52.7512, -2.8497, 1.8636], [-48.3661, -2.6128, -2.7419], [-47.4464, -2.5631, -1.8636], [-51.8314, -2.8, 2.7419]]
    ,[[-52.3861, -8.114, 1.8914], [-48.3129, -7.4831, -2.7157], [-47.4023, -7.3421, -1.8914], [-51.4756, -7.973, 2.7157]]
    ,[[-51.5026, -13.3011, 1.9125], [-47.7684, -12.3367, -2.6838], [-46.8784, -12.1069, -1.9125], [-50.6126, -13.0713, 2.6838]]
    ,[[-50.1157, -18.3616, 1.927], [-46.7387, -17.1243, -2.6464], [-45.8799, -16.8096, -1.927], [-49.2569, -18.0469, 2.6464]]
    ,[[-48.2449, -23.2483, 1.9352], [-45.2344, -21.7975, -2.6036], [-44.4166, -21.4035, -1.9352], [-47.4271, -22.8542, 2.6036]]
    ,[[-45.9137, -27.9171, 1.9371], [-43.2708, -26.3101, -2.5557], [-42.503, -25.8433, -1.9371], [-45.1459, -27.4502, 2.5557]]
    ,[[-43.1493, -32.327, 1.9328], [-40.8678, -30.6178, -2.5029], [-40.1579, -30.0859, -1.9328], [-42.4393, -31.7951, 2.5029]]
    ,[[-39.9822, -36.4404, 1.9224], [-38.0494, -34.6789, -2.4455], [-37.4038, -34.0904, -1.9224], [-39.3365, -35.852, 2.4455]]
    ,[[-36.4458, -40.2234, 1.9062], [-34.8432, -38.4547, -2.3836], [-34.2671, -37.8189, -1.9062], [-35.8698, -39.5876, 2.3836]]
    ,[[-32.576, -43.6457, 1.8843], [-31.2804, -41.9098, -2.3175], [-30.7777, -41.2363, -1.8843], [-32.0734, -42.9723, 2.3175]]
    ,[[-28.4107, -46.6811, 1.8567], [-27.3951, -45.0122, -2.2475], [-26.9683, -44.311, -1.8567], [-27.984, -45.9799, 2.2475]]
    ,[[-23.9894, -49.307, 1.8238], [-23.224, -47.7338, -2.1737], [-22.8742, -47.0149, -1.8238], [-23.6397, -48.5881, 2.1737]]
    ,[[-19.353, -51.5054, 1.7857], [-18.8063, -50.0505, -2.0966], [-18.5332, -49.3236, -1.7857], [-19.0799, -50.7785, 2.0966]]
    ,[[-14.5431, -53.2617, 1.7426], [-14.1827, -51.9419, -2.0162], [-13.9847, -51.2167, -1.7426], [-14.3451, -52.5365, 2.0162]]
    ,[[-9.6019, -54.5657, 1.6946], [-9.3954, -53.3923, -1.9329], [-9.2697, -52.6778, -1.6946], [-9.4761, -53.8511, 1.9329]]
    ,[[-4.5717, -55.4109, 1.6421], [-4.4874, -54.3899, -1.847], [-4.4301, -53.6944, -1.6421], [-4.5143, -54.7154, 1.847]]
    ,[[0.5054, -55.7948, 1.5852], [0.4975, -54.9272, -1.7587], [0.4914, -54.2584, -1.5852], [0.4993, -55.126, 1.7587]]
    ,[[5.5877, -55.7184, 1.5241], [5.5157, -55.001, -1.6683], [5.452, -54.3657, -1.5241], [5.524, -55.0832, 1.6683]]
    ,[[10.6345, -55.1867, 1.459], [10.5238, -54.6123, -1.576], [10.4089, -54.0162, -1.459], [10.5196, -54.5906, 1.576]]
    ,[[15.6062, -54.2076, 1.3903], [15.479, -53.7659, -1.4822], [15.32, -53.2138, -1.3903], [15.4472, -53.6555, 1.4822]]
    ,[[20.4644, -52.7927, 1.3181], [20.3396, -52.4708, -1.3872], [20.144, -51.9663, -1.3181], [20.2688, -52.2882, 1.3872]]
    ,[[25.1725, -50.9564, 1.2428], [25.0653, -50.7395, -1.2912], [24.8409, -50.2851, -1.2428], [24.948, -50.502, 1.2912]]
    ,[[29.6956, -48.7161, 1.1644], [29.6176, -48.5881, -1.1944], [29.372, -48.1852, -1.1644], [29.4501, -48.3133, 1.1944]]
    ,[[34.0009, -46.0918, 1.0834], [33.9598, -46.0361, -1.0973], [33.7009, -45.6851, -1.0834], [33.742, -45.7408, 1.0973]]
    ,[[38.0578, -43.1059, 1], [38.0578, -43.1059, -1], [37.793, -42.8061, -1], [37.793, -42.8061, 1]]
    ];

    sects = cross_sections(shape_pts, pts, angles, twist = 180, scale = 0.1);

    for(i = [0:len(expected) - 1]) {
        assertEqualPoints(expected[i], sects[i]);
    }
}

test_cross_sections();