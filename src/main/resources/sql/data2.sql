
-- user2
INSERT INTO users (user_id, email, password, phone_number, name, role, created_at, updated_at, wallet_address)
VALUES
    (UNHEX(REPLACE('2222c0f7-0c97-4bd7-a200-0de1392f1df1', '-', '')), 'test2@user.com', '$2a$04$PqAI9RkcXM3QK6A/GkpbCetMX5Bh7Mt9eV5vO/3ULVPPJwG7Vishi', '01012341234', 'test_user2', 'USER', NOW(), NOW(), 'sEdVWVdgWwF7zM7mSRhbMQC1xMsgXeZ')
    ON DUPLICATE KEY UPDATE user_id = user_id;

INSERT INTO accounts (account_id, user_id, deposit, average_earning_rate)
VALUES
    (UNHEX(REPLACE('6111c0f7-0c97-4bd7-a200-0de1392f1df1', '-', '')), UNHEX(REPLACE('2222c0f7-0c97-4bd7-a200-0de1392f1df1', '-', '')), 9999999999999, 0.0)
    ON DUPLICATE KEY UPDATE account_id = account_id;


-- properties 테이블에 샘플 데이터 삽입
INSERT INTO properties (property_id, property_name, oneline, view_count, like_count, total_volume, created_at, updated_at, type, uploader_wallet_address)
VALUES
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '예시 임야', '이 매물은 예시 임야입니다.', 0, 0, 20000000, '2023-01-01 00:00:00', NOW(), 'land', 'sEdTbTjySW4QE9eaEnULQdd5mxr7KhT')
    ON DUPLICATE KEY UPDATE property_id = property_id;

-- fundraises 테이블에 샘플 데이터 삽입, property_id는 방금 삽입된 properties 테이블 데이터 참조
INSERT INTO fundraises (fundraise_id, property_id, progress_rate, progress_amount, investor_count, security_type, issuer, security_count, issue_price, total_fund, subscription_start_date, subscription_end_date, operator_name, operator_introduction)
VALUES
    (UNHEX(REPLACE('3222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), 100.0, 10000000, 261, '보통증권', 'DEF 회사', 2000, 5000, 10000000, '2023-01-01', '2023-02-01', 'LMN 운영사', '이 운영사는 LMN입니다.')
    ON DUPLICATE KEY UPDATE fundraise_id = fundraise_id;

-- lands 테이블에 샘플 데이터 삽입, property_id는 방금 삽입된 properties 테이블 데이터 참조
INSERT INTO lands (land_id, property_id, area, land_use, etc, recommend_use, parking, nearest_station)
VALUES
    (UNHEX(REPLACE('4222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '105,785㎡(32,000평)', '상업용지', '조망 뷰 좋습니다.', '숲경영체험림', 1, '김천역')
    ON DUPLICATE KEY UPDATE land_id = land_id;

-- locations 테이블에 샘플 데이터 삽입, property_id는 방금 삽입된 properties 테이블 데이터 참조
INSERT INTO locations (location_id, property_id, city, gu, dong, detail)
VALUES
    (UNHEX(REPLACE('5222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '경상북도', '김천시', '부항면', '안간리')
    ON DUPLICATE KEY UPDATE location_id = location_id;

-- d168mchs3bjm5x.cloudfront.net/39f4bd39-7693-4d0f-8971-2f5bdaedb202_9e7dd875-5cd0-4776-9ca8-264c6fdb440a.jpg
INSERT INTO thumbnail_urls (property_id, cloudfront_url) VALUES
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), 'd168mchs3bjm5x.cloudfront.net/228ed1b8-05e8-4e3b-95ae-d084941be679_KakaoTalk_Photo_2024-06-13-13-17-53 001.jpeg')
    ON DUPLICATE KEY UPDATE property_id = property_id;

-- DayTransactionLog 테이블에 2024년 3월 1일부터 2024년 4월 30일까지의 데이터를 추가
INSERT INTO day_transaction_logs (property_id, date, fluctuation_rate, opening_price, closing_price, max_price, min_price, volume_count)
VALUES
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-01', (5550 - 5500) / 5500.0 * 100, 5500, 5550, 5600, 5450, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-02', (5500 - 5550) / 5550.0 * 100, 5550, 5500, 5600, 5450, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-03', (5585 - 5500) / 5500.0 * 100, 5500, 5585, 5650, 5450, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-04', (5555 - 5585) / 5585.0 * 100, 5585, 5555, 5600, 5500, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-05', (5655 - 5555) / 5555.0 * 100, 5555, 5655, 5700, 5500, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-06', (5580 - 5655) / 5655.0 * 100, 5655, 5580, 5700, 5550, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-07', (5630 - 5580) / 5580.0 * 100, 5580, 5630, 5650, 5550, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-08', (5580 - 5630) / 5630.0 * 100, 5630, 5580, 5700, 5550, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-09', (5680 - 5580) / 5580.0 * 100, 5580, 5680, 5750, 5550, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-10', (5605 - 5680) / 5680.0 * 100, 5680, 5605, 5700, 5575, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-11', (5655 - 5605) / 5605.0 * 100, 5605, 5655, 5700, 5550, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-12', (5630 - 5655) / 5655.0 * 100, 5655, 5630, 5700, 5600, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-13', (5730 - 5630) / 5630.0 * 100, 5630, 5730, 5800, 5600, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-14', (5680 - 5730) / 5730.0 * 100, 5730, 5680, 5750, 5650, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-15', (5730 - 5680) / 5680.0 * 100, 5680, 5730, 5800, 5650, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-16', (5705 - 5730) / 5730.0 * 100, 5730, 5705, 5750, 5650, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-17', (5790 - 5705) / 5705.0 * 100, 5705, 5790, 5850, 5650, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-18', (5740 - 5790) / 5790.0 * 100, 5790, 5740, 5800, 5700, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-19', (5790 - 5740) / 5740.0 * 100, 5740, 5790, 5850, 5700, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-20', (5815 - 5790) / 5790.0 * 100, 5790, 5815, 5850, 5750, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-21', (5705 - 5815) / 5815.0 * 100, 5815, 5705, 5825, 5650, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-22', (5790 - 5705) / 5705.0 * 100, 5705, 5790, 5850, 5650, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-23', (5840 - 5790) / 5790.0 * 100, 5790, 5840, 5900, 5750, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-24', (5815 - 5840) / 5840.0 * 100, 5840, 5815, 5850, 5750, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-25', (5915 - 5815) / 5815.0 * 100, 5815, 5915, 6000, 5750, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-26', (5865 - 5915) / 5915.0 * 100, 5915, 5865, 5950, 5800, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-27', (5915 - 5865) / 5865.0 * 100, 5865, 5915, 6000, 5800, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-28', (5890 - 5915) / 5915.0 * 100, 5915, 5890, 5950, 5850, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-29', (5980 - 5890) / 5890.0 * 100, 5890, 5980, 6050, 5850, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-30', (5930 - 5980) / 5980.0 * 100, 5980, 5930, 6000, 5900, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-03-31', (5980 - 5930) / 5930.0 * 100, 5930, 5980, 6050, 5900, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-01', (6030 - 5980) / 5980.0 * 100, 5980, 6030, 6100, 5950, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-02', (6005 - 6030) / 6030.0 * 100, 6030, 6005, 6050, 5950, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-03', (6105 - 6005) / 6005.0 * 100, 6005, 6105, 6150, 5950, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-04', (6055 - 6105) / 6105.0 * 100, 6105, 6055, 6150, 6000, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-05', (6105 - 6055) / 6055.0 * 100, 6055, 6105, 6150, 6000, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-06', (6080 - 6105) / 6105.0 * 100, 6105, 6080, 6150, 6050, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-07', (6180 - 6080) / 6080.0 * 100, 6080, 6180, 6250, 6050, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-08', (6105 - 6180) / 6180.0 * 100, 6180, 6105, 6200, 6050, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-09', (6155 - 6105) / 6105.0 * 100, 6105, 6155, 6200, 6050, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-10', (6105 - 6155) / 6155.0 * 100, 6155, 6105, 6200, 6050, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-11', (6205 - 6105) / 6105.0 * 100, 6105, 6205, 6250, 6050, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-12', (6130 - 6205) / 6205.0 * 100, 6205, 6130, 6250, 6100, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-13', (6180 - 6130) / 6130.0 * 100, 6130, 6180, 6200, 6100, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-14', (6155 - 6180) / 6180.0 * 100, 6180, 6155, 6200, 6100, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-15', (6255 - 6155) / 6155.0 * 100, 6155, 6255, 6300, 6100, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-16', (6205 - 6255) / 6255.0 * 100, 6255, 6205, 6300, 6150, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-17', (6255 - 6205) / 6205.0 * 100, 6205, 6255, 6300, 6150, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-18', (6230 - 6255) / 6255.0 * 100, 6255, 6230, 6300, 6200, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-19', (6330 - 6230) / 6230.0 * 100, 6230, 6330, 6400, 6200, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-20', (6255 - 6330) / 6330.0 * 100, 6330, 6255, 6400, 6300, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-21', (6305 - 6255) / 6255.0 * 100, 6255, 6305, 6350, 6200, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-22', (6255 - 6305) / 6305.0 * 100, 6305, 6255, 6400, 6200, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-23', (6355 - 6255) / 6255.0 * 100, 6255, 6355, 6450, 6200, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-24', (6280 - 6355) / 6355.0 * 100, 6355, 6280, 6400, 6250, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-25', (6330 - 6280) / 6280.0 * 100, 6280, 6330, 6400, 6250, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-26', (6305 - 6330) / 6330.0 * 100, 6330, 6305, 6350, 6250, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-27', (6405 - 6305) / 6305.0 * 100, 6305, 6405, 6500, 6250, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-28', (6355 - 6405) / 6405.0 * 100, 6405, 6355, 6450, 6300, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-29', (6405 - 6355) / 6355.0 * 100, 6355, 6405, 6500, 6300, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-04-30', (6380 - 6405) / 6405.0 * 100, 6405, 6380, 6450, 6350, 1500)
    ON DUPLICATE KEY UPDATE day_transaction_log_id = day_transaction_log_id;

-- DayTransactionLog 테이블에 2024년 5월 1일부터 2024년 6월 5일까지의 데이터를 추가
INSERT INTO day_transaction_logs (property_id, date, fluctuation_rate, opening_price, closing_price, max_price, min_price, volume_count)
VALUES
    -- 4월 30일 데이터를 기준으로 시작
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-01', (6430 - 6380) / 6380.0 * 100, 6380, 6430, 6500, 6350, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-02', (6400 - 6430) / 6430.0 * 100, 6430, 6400, 6450, 6350, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-03', (6470 - 6400) / 6400.0 * 100, 6400, 6470, 6550, 6350, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-04', (6420 - 6470) / 6470.0 * 100, 6470, 6420, 6500, 6400, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-05', (6500 - 6420) / 6420.0 * 100, 6420, 6500, 6550, 6400, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-06', (6440 - 6500) / 6500.0 * 100, 6500, 6440, 6550, 6400, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-07', (6480 - 6440) / 6440.0 * 100, 6440, 6480, 6550, 6400, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-08', (6430 - 6480) / 6480.0 * 100, 6480, 6430, 6500, 6400, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-09', (6520 - 6430) / 6430.0 * 100, 6430, 6520, 6600, 6400, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-10', (6460 - 6520) / 6520.0 * 100, 6520, 6460, 6550, 6450, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-11', (6490 - 6460) / 6460.0 * 100, 6460, 6490, 6550, 6450, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-12', (6440 - 6490) / 6490.0 * 100, 6490, 6440, 6500, 6400, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-13', (6530 - 6440) / 6440.0 * 100, 6440, 6530, 6600, 6400, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-14', (6470 - 6530) / 6530.0 * 100, 6530, 6470, 6550, 6450, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-15', (6510 - 6470) / 6470.0 * 100, 6470, 6510, 6600, 6450, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-16', (6460 - 6510) / 6510.0 * 100, 6510, 6460, 6550, 6450, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-17', (6550 - 6460) / 6460.0 * 100, 6460, 6550, 6600, 6450, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-18', (6490 - 6550) / 6550.0 * 100, 6550, 6490, 6600, 6450, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-19', (6530 - 6490) / 6490.0 * 100, 6490, 6530, 6600, 6450, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-20', (6480 - 6530) / 6530.0 * 100, 6530, 6480, 6550, 6450, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-21', (6570 - 6480) / 6480.0 * 100, 6480, 6570, 6600, 6450, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-22', (6510 - 6570) / 6570.0 * 100, 6570, 6510, 6600, 6450, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-23', (6550 - 6510) / 6510.0 * 100, 6510, 6550, 6600, 6450, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-24', (6500 - 6550) / 6550.0 * 100, 6550, 6500, 6550, 6450, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-25', (6590 - 6500) / 6500.0 * 100, 6500, 6590, 6600, 6450, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-26', (6530 - 6590) / 6590.0 * 100, 6590, 6530, 6600, 6500, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-27', (6570 - 6530) / 6530.0 * 100, 6530, 6570, 6600, 6500, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-28', (6520 - 6570) / 6570.0 * 100, 6570, 6520, 6550, 6500, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-29', (6610 - 6520) / 6520.0 * 100, 6520, 6610, 6700, 6500, 1800),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-30', (6550 - 6610) / 6610.0 * 100, 6610, 6550, 6650, 6500, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-05-31', (6590 - 6550) / 6550.0 * 100, 6550, 6590, 6650, 6500, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-01', (6630 - 6590) / 6590.0 * 100, 6590, 6630, 6700, 6550, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-02', (6680 - 6630) / 6630.0 * 100, 6630, 6680, 6750, 6600, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-03', (6650 - 6680) / 6680.0 * 100, 6680, 6650, 6700, 6600, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-04', (6700 - 6650) / 6650.0 * 100, 6650, 6700, 6750, 6600, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-05', (6750 - 6700) / 6700.0 * 100, 6700, 6750, 6800, 6650, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-06', (6700 - 6750) / 6750.0 * 100, 6750, 6700, 6800, 6650, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-07', (6750 - 6700) / 6700.0 * 100, 6700, 6750, 6800, 6650, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-08', (6800 - 6750) / 6750.0 * 100, 6750, 6800, 6850, 6700, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-09', (6750 - 6800) / 6800.0 * 100, 6800, 6750, 6850, 6700, 1500),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-10', (6800 - 6750) / 6750.0 * 100, 6750, 6800, 6850, 6700, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-11', (6850 - 6800) / 6800.0 * 100, 6800, 6850, 6900, 6700, 1700),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-12', (6800 - 6850) / 6850.0 * 100, 6850, 6800, 6900, 6700, 1600),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-13', (6850 - 6800) / 6800.0 * 100, 6800, 6850, 6900, 6700, 1500)
    ON DUPLICATE KEY UPDATE day_transaction_log_id = day_transaction_log_id;

-- RealTimeTransactionLog 테이블에 2024년 6월 5일의 데이터를 추가
INSERT INTO real_time_transaction_logs (real_time_transaction_log_id, property_id, executed_at, quantity, executed_price, fluctuation_rate)
VALUES
    (UNHEX(REPLACE('2222c0f7-2a97-4bd7-a200-0de1392f1df0', '-', '')), UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-13 09:00:00', 100, 6800, (6800 - 6800) / 6800.0 * 100),
    (UNHEX(REPLACE('2222c0f7-2b97-4bd7-a200-0de1392f1df0', '-', '')), UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-13 12:00:00', 150, 6700, (6700 - 6800) / 6800.0 * 100),
    (UNHEX(REPLACE('2222c0f7-2c57-4bd7-a200-0de1392f1df0', '-', '')), UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-13 15:00:00', 200, 6900, (6900 - 6800) / 6800.0 * 100),
    (UNHEX(REPLACE('2222c0f7-2c77-4bd7-a200-0de1392f1df0', '-', '')), UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '2024-06-13 18:00:00', 250, 6850, (6850 - 6800) / 6800.0 * 100)
    ON DUPLICATE KEY UPDATE quantity = VALUES(quantity), executed_price = VALUES(executed_price), fluctuation_rate = VALUES(fluctuation_rate);


-- user3
INSERT INTO users (user_id, email, password, phone_number, name, role, created_at, updated_at, wallet_address)
VALUES
    (UNHEX(REPLACE('2222c0f7-0c97-4bd7-a200-0de1392f1df2', '-', '')),'test3@user.com' , '$2a$04$PqAI9RkcXM3QK6A/GkpbCetMX5Bh7Mt9eV5vO/3ULVPPJwG7Vishi', '01012341234', 'test_user3', 'USER', NOW(), NOW(), 'sEdTT3DNvFfAqzL9eYaHaomTLGPLWbo')
    ON DUPLICATE KEY UPDATE user_id = user_id;

INSERT INTO accounts (account_id, user_id, deposit, average_earning_rate)
VALUES
    (UNHEX(REPLACE('6111c0f7-0c97-4bd7-a200-0de1392f1df2', '-', '')), UNHEX(REPLACE('2222c0f7-0c97-4bd7-a200-0de1392f1df2', '-', '')), 9999999999999, 0.0)
    ON DUPLICATE KEY UPDATE account_id = account_id;

    -- user3이 처음에 3000개의 예시 임야를 5000원에 구매
-- INSERT INTO inventorys (inventory_id, quantity, sellable_quantity, average_buying_price, earnings_rate, account_id, property_id) VALUES
--     (UNHEX(REPLACE('1111c0f7-0c97-4bd7-a200-0de1392f1df0', '-', '')), 3000, 3000, 5000, 0.0, UNHEX(REPLACE('6111c0f7-0c97-4bd7-a200-0de1392f1df0', '-', '')), UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', ''))
--     ON DUPLICATE KEY UPDATE inventory_id = inventory_id;

-- summaries 테이블에 샘플 데이터 삽입, property_id는 방금 삽입된 properties 테이블 데이터 참조
INSERT INTO summaries (property_id, content, created_at)
VALUES
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '예시 임야에 대한 세 가지 주요 뉴스는 다음과 같습니다. 첫째, 조각투자사가 소유한 이 부동산은 완판되었습니다. 둘째, 루센트블록이 소유한 이 상품의 공모가 시작되었습니다. 셋째, 삼성도 이 부동산 상품의 공모에 관심을 가지고 있습니다. 투자 정보로는 연 7% 고정 배당금이 지급되고, 시세 대비 저렴한 공모가로 높은 매각 차익이 기대되며, 역세권 상업용 최적 입지를 가지고 있다는 점이 강조됩니다.', NOW())
    ON DUPLICATE KEY UPDATE property_id = property_id;

INSERT INTO investment_points (property_id, title)
VALUES
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '연 6% 고정 배당금 지급'),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '시세 대비 낮은 공모가, 매각 차익 기대'),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '신도림역 더블 역세권, 오피스 최적 입지')
    ON DUPLICATE KEY UPDATE property_id = property_id;

INSERT INTO news (property_id, title, reported_at, publisher) VALUES
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '조각투자사 소유, 부동산 완판', '2024-04-04', '뉴스투데이'),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '조각투자사2 소유, 공모 시작', '2024-04-05', '뉴스투데이'),
    (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), '조각투자사3 소유, 공모 시작 및 부동산 완판', '2024-04-06', '매일경제')
    ON DUPLICATE KEY UPDATE property_id = property_id;

INSERT INTO documents (property_id, cloudfront_url, title) VALUES
                                                               (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), 'd168mchs3bjm5x.cloudfront.net/59d455cf-3b20-45ff-9434-e1e03204dd36_UI.pdf', '공모 청약 안내문'),
                                                               (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), 'd168mchs3bjm5x.cloudfront.net/59d455cf-3b20-45ff-9434-e1e03204dd36_UI.pdf', '증권신고서'),
                                                               (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), 'd168mchs3bjm5x.cloudfront.net/59d455cf-3b20-45ff-9434-e1e03204dd36_UI.pdf', '투자설명서'),
                                                               (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), 'd168mchs3bjm5x.cloudfront.net/59d455cf-3b20-45ff-9434-e1e03204dd36_UI.pdf', '부동산관리처분신탁계약서'),
                                                               (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), 'd168mchs3bjm5x.cloudfront.net/59d455cf-3b20-45ff-9434-e1e03204dd36_UI.pdf', '감정평가보고서(대한)'),
                                                               (UNHEX(REPLACE('2222c0f7-2c97-4bd7-a200-0de1392f1df0', '-', '')), 'd168mchs3bjm5x.cloudfront.net/59d455cf-3b20-45ff-9434-e1e03204dd36_UI.pdf', '감정평가보고서(태평양)')
    ON DUPLICATE KEY UPDATE property_id = property_id;



