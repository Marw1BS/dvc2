import requests

def test_predict_online():
    url = "https://happy-marleen-marw1bs-c0b23ecb.koyeb.app/predict"
    payload = {
        "input": {
            "pixel_0_0": 0.0, "pixel_0_1": 0.0, "pixel_0_2": 7.0, "pixel_0_3": 14.0,
            "pixel_0_4": 9.0, "pixel_0_5": 0.0, "pixel_0_6": 0.0, "pixel_0_7": 0.0,
            "pixel_1_0": 0.0, "pixel_1_1": 1.0, "pixel_1_2": 16.0, "pixel_1_3": 5.0,
            "pixel_1_4": 10.0, "pixel_1_5": 7.0, "pixel_1_6": 0.0, "pixel_1_7": 0.0,
            "pixel_2_0": 0.0, "pixel_2_1": 0.0, "pixel_2_2": 13.0, "pixel_2_3": 2.0,
            "pixel_2_4": 3.0, "pixel_2_5": 13.0, "pixel_2_6": 0.0, "pixel_2_7": 0.0,
            "pixel_3_0": 0.0, "pixel_3_1": 0.0, "pixel_3_2": 5.0, "pixel_3_3": 15.0,
            "pixel_3_4": 16.0, "pixel_3_5": 16.0, "pixel_3_6": 1.0, "pixel_3_7": 0.0,
            "pixel_4_0": 0.0, "pixel_4_1": 0.0, "pixel_4_2": 0.0, "pixel_4_3": 0.0,
            "pixel_4_4": 5.0, "pixel_4_5": 10.0, "pixel_4_6": 7.0, "pixel_4_7": 0.0,
            "pixel_5_0": 0.0, "pixel_5_1": 0.0, "pixel_5_2": 0.0, "pixel_5_3": 0.0,
            "pixel_5_4": 0.0, "pixel_5_5": 2.0, "pixel_5_6": 14.0, "pixel_5_7": 0.0,
            "pixel_6_0": 0.0, "pixel_6_1": 0.0, "pixel_6_2": 4.0, "pixel_6_3": 2.0,
            "pixel_6_4": 0.0, "pixel_6_5": 0.0, "pixel_6_6": 14.0, "pixel_6_7": 3.0,
            "pixel_7_0": 0.0, "pixel_7_1": 0.0, "pixel_7_2": 5.0, "pixel_7_3": 15.0,
            "pixel_7_4": 16.0, "pixel_7_5": 16.0, "pixel_7_6": 12.0, "pixel_7_7": 1.0
        }
    }
    response = requests.post(url, json=payload)
    assert response.status_code == 200
    data = response.json()
    assert "prediction" in data
