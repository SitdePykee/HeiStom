INSERT INTO lodgings (
    id, address, area, day_price, description, hour_price, lat, lng, name, owner_id, upload_date, amenities
) VALUES (
    'a1f6d8c0-7c64-4e2e-bfc6-1d9f3c1d1f01',
    '123 Đường Láng, Đống Đa, Hà Nội',
    25.0, 300000, 'Phòng trọ tiện nghi, gần trường học', 50000,
    21.0285, 105.8352, 'Phòng Trọ Sinh Viên', 'b2a2c6b3-8d64-4c7b-98d7-7f3a6f9b5a02',
    1715664000, 'free_wifi,air_conditioning,free_parking'
);

INSERT INTO lodgings (
    id, address, area, day_price, description, hour_price, lat, lng, name, owner_id, upload_date, amenities
) VALUES (
    'b3d7f6a1-e4d5-413e-a4ff-2f89a3c9b2a3',
    '45 Hoàng Cầu, Ô Chợ Dừa, Hà Nội',
    30.5, 400000, 'Căn hộ mini cho thuê ngắn hạn', 70000,
    21.0176, 105.8221, 'Căn Hộ Mini Hoàng Cầu', 'c3b4d1f6-23e3-43c6-a6b1-5c3c6c8f7e54',
    1715664000, 'free_wifi,air_conditioning,swimming_pool,gym'
);

INSERT INTO lodgings (
    id, address, area, day_price, description, hour_price, lat, lng, name, owner_id, upload_date, amenities
) VALUES (
    'c9f3a2b5-d3c7-442b-819c-f6d3a45e6d71',
    '17 Nguyễn Trãi, Thanh Xuân, Hà Nội',
    20.0, 250000, 'Phòng trọ giá rẻ, an ninh tốt', 40000,
    20.9942, 105.8140, 'Phòng Trọ Nguyễn Trãi', 'd7e2f1a8-7f43-49cf-9271-49e77c6f4e2a',
    1715664000, 'free_wifi,free_parking,children_friendly'
);

INSERT INTO lodgings (
    id, address, area, day_price, description, hour_price, lat, lng, name, owner_id, upload_date, amenities
) VALUES (
    'd4c2b9e3-a314-4b9f-92a9-1e1c4e5c1f87',
    '89 Cầu Giấy, Cầu Giấy, Hà Nội',
    35.0, 450000, 'Chỗ ở cao cấp, đầy đủ tiện nghi', 80000,
    21.0362, 105.7901, 'Lodging Cầu Giấy', 'e8a9c3b2-f784-4875-81c3-b3ac4d7a123b',
    1715664000, 'free_wifi,bar,private_dining_room,air_conditioning'
);

INSERT INTO lodgings (
    id, address, area, day_price, description, hour_price, lat, lng, name, owner_id, upload_date, amenities
) VALUES (
    'e3a8f3c1-d5f6-47ab-9cd1-7f9c1c2a3451',
    '12 Trần Duy Hưng, Cầu Giấy, Hà Nội',
    28.0, 380000, 'Phòng tiện nghi, gần trung tâm', 60000,
    21.0137, 105.8006, 'Phòng Trọ Trung Tâm', 'f1b2c3d4-9e87-42b9-b3a7-1e2f3c4d5a6b',
    1715664000, 'pet_friendly,free_breakfast,free_wifi'
);



INSERT INTO rooms (id, capacity, lodging_id, renter, room_name, status) VALUES
('6e5533fa-97dc-4baf-a9cc-029f1e94c801', 2, 'a1f6d8c0-7c64-4e2e-bfc6-1d9f3c1d1f01', NULL, 101, 'AVAILABLE'),
('7e778add-372a-4129-83e7-8c36c59a01cc', 4, 'a1f6d8c0-7c64-4e2e-bfc6-1d9f3c1d1f01', NULL, 102, 'AVAILABLE'),
('37bd1b67-9aa0-41a5-b027-e8f0a1bd5783', 3, 'a1f6d8c0-7c64-4e2e-bfc6-1d9f3c1d1f01', NULL, 103, 'AVAILABLE');

INSERT INTO rooms (id, capacity, lodging_id, renter, room_name, status) VALUES
('4a5a6504-1b4e-4917-8a9e-60f6d2c162ce', 5, 'b3d7f6a1-e4d5-413e-a4ff-2f89a3c9b2a3', NULL, 101, 'AVAILABLE'),
('09bb90f3-0a5e-4604-a7bc-891998c17899', 2, 'b3d7f6a1-e4d5-413e-a4ff-2f89a3c9b2a3', NULL, 102, 'AVAILABLE');

INSERT INTO rooms (id, capacity, lodging_id, renter, room_name, status) VALUES
('5dc8fd4a-3571-43b9-bc2f-9f5ea7cd1b0c', 3, 'c9f3a2b5-d3c7-442b-819c-f6d3a45e6d71', NULL, 101, 'AVAILABLE'),
('960bb8eb-c85d-44de-861e-4fc62ae5872b', 1, 'c9f3a2b5-d3c7-442b-819c-f6d3a45e6d71', NULL, 102, 'AVAILABLE'),
('3fe4231f-8999-4b74-847a-2f542f1b7efc', 2, 'c9f3a2b5-d3c7-442b-819c-f6d3a45e6d71', NULL, 103, 'AVAILABLE');

INSERT INTO rooms (id, capacity, lodging_id, renter, room_name, status) VALUES
('f3d73963-e2f4-4f9b-9499-9d5ef429bfd5', 6, 'd4c2b9e3-a314-4b9f-92a9-1e1c4e5c1f87', NULL, 101, 'AVAILABLE'),
('f06efb4a-e06d-45f4-9e77-213239f4c045', 5, 'd4c2b9e3-a314-4b9f-92a9-1e1c4e5c1f87', NULL, 102, 'AVAILABLE');

INSERT INTO rooms (id, capacity, lodging_id, renter, room_name, status) VALUES
('b1c64c3a-e631-4f2a-8589-1a8acdd98fa5', 2, 'e3a8f3c1-d5f6-47ab-9cd1-7f9c1c2a3451', NULL, 101, 'AVAILABLE'),
('8c9a8d43-47a7-4e6d-91e8-0f0e21b9a845', 4, 'e3a8f3c1-d5f6-47ab-9cd1-7f9c1c2a3451', NULL, 102, 'AVAILABLE'),
('f163b8c5-18c6-45d1-a3a6-5ff1b789ad01', 7, 'e3a8f3c1-d5f6-47ab-9cd1-7f9c1c2a3451', NULL, 103, 'AVAILABLE');




INSERT INTO users (uuid, address, avatar, email, name, password, phone_number, type) VALUES
('e1b2c3d4-1111-4f5a-b678-1234567890ab', '123 Lê Lợi, Hà Nội', 'https://example.com/avatar1.png', 'linhpham@gmail.com', 'Phạm Thùy Linh', '123456', '0987654321', 'USER');

INSERT INTO users (uuid, address, avatar, email, name, password, phone_number, type) VALUES
('f2c3d4e5-2222-4a6b-c789-2345678901bc', '456 Nguyễn Trãi, Đà Nẵng', 'https://example.com/avatar2.png', 'minhnguyen@gmail.com', 'Nguyễn Văn Minh', '123456', '0912345678', 'USER');

INSERT INTO users (uuid, address, avatar, email, name, password, phone_number, type) VALUES
('a3d4e5f6-3333-4c7d-d890-3456789012cd', '789 Trần Phú, TP.HCM', 'https://example.com/avatar3.png', 'thuyle@gmail.com', 'Lê Thị Thúy', '123456', '0909123456', 'USER');




INSERT INTO bookings (booking_id, lodging_id, room_id, user_id, check_in_at, check_out_at, is_bank_transfer, num_of_room) VALUES
('79c0c286-73d6-4081-865b-7da42389489f', 'b3d7f6a1-e4d5-413e-a4ff-2f89a3c9b2a3', '960bb8eb-c85d-44de-861e-4fc62ae5872b', 'e1b2c3d4-1111-4f5a-b678-1234567890ab', 1747299731, 1747386131, true, 3);

INSERT INTO bookings (booking_id, lodging_id, room_id, user_id, check_in_at, check_out_at, is_bank_transfer, num_of_room) VALUES
('25960136-b10c-4dc5-85f1-e60e867df1b2', 'd4c2b9e3-a314-4b9f-92a9-1e1c4e5c1f87', '3fe4231f-8999-4b74-847a-2f542f1b7efc', 'f2c3d4e5-2222-4a6b-c789-2345678901bc', 1747389383, 1747562183, true, 1);

INSERT INTO bookings (booking_id, lodging_id, room_id, user_id, check_in_at, check_out_at, is_bank_transfer, num_of_room) VALUES
('6d73bb0a-f94b-4c5d-9bdf-7ef9304e78c7', 'e3a8f3c1-d5f6-47ab-9cd1-7f9c1c2a3451', '7e778add-372a-4129-83e7-8c36c59a01cc', 'a3d4e5f6-3333-4c7d-d890-3456789012cd', 1747294866, 1747381266, false, 1);

INSERT INTO bookings (booking_id, lodging_id, room_id, user_id, check_in_at, check_out_at, is_bank_transfer, num_of_room) VALUES
('bce52676-28f7-403e-9ce1-83e816015110', 'd4c2b9e3-a314-4b9f-92a9-1e1c4e5c1f87', '37bd1b67-9aa0-41a5-b027-e8f0a1bd5783', 'f2c3d4e5-2222-4a6b-c789-2345678901bc', 1747242068, 1747328468, false, 4);

INSERT INTO bookings (booking_id, lodging_id, room_id, user_id, check_in_at, check_out_at, is_bank_transfer, num_of_room) VALUES
('c5fcf3a0-a29d-4e55-a007-0653b1de1208', 'd4c2b9e3-a314-4b9f-92a9-1e1c4e5c1f87', '4a5a6504-1b4e-4917-8a9e-60f6d2c162ce', 'e1b2c3d4-1111-4f5a-b678-1234567890ab', 1747234766, 1747493966, true, 3);

INSERT INTO bookings (booking_id, lodging_id, room_id, user_id, check_in_at, check_out_at, is_bank_transfer, num_of_room) VALUES
('b36739eb-73e5-4916-bc17-8a4348b777f8', 'a1f6d8c0-7c64-4e2e-bfc6-1d9f3c1d1f01', 'b1c64c3a-e631-4f2a-8589-1a8acdd98fa5', 'f2c3d4e5-2222-4a6b-c789-2345678901bc', 1747320981, 1747493781, true, 3);

INSERT INTO bookings (booking_id, lodging_id, room_id, user_id, check_in_at, check_out_at, is_bank_transfer, num_of_room) VALUES
('6df1ec88-de3f-47a3-b109-caa2c769d15a', 'c9f3a2b5-d3c7-442b-819c-f6d3a45e6d71', '7e778add-372a-4129-83e7-8c36c59a01cc', 'f2c3d4e5-2222-4a6b-c789-2345678901bc', 1747270220, 1747356620, true, 4);

INSERT INTO bookings (booking_id, lodging_id, room_id, user_id, check_in_at, check_out_at, is_bank_transfer, num_of_room) VALUES
('77a76172-fa2e-40cf-9aae-f355b4ae6118', 'c9f3a2b5-d3c7-442b-819c-f6d3a45e6d71', '6e5533fa-97dc-4baf-a9cc-029f1e94c801', 'f2c3d4e5-2222-4a6b-c789-2345678901bc', 1747229724, 1747316124, true, 4);

INSERT INTO bookings (booking_id, lodging_id, room_id, user_id, check_in_at, check_out_at, is_bank_transfer, num_of_room) VALUES
('5e0a45d6-336c-4816-9510-3218853235b0', 'e3a8f3c1-d5f6-47ab-9cd1-7f9c1c2a3451', '4a5a6504-1b4e-4917-8a9e-60f6d2c162ce', 'f2c3d4e5-2222-4a6b-c789-2345678901bc', 1747289232, 1747375632, true, 1);

INSERT INTO bookings (booking_id, lodging_id, room_id, user_id, check_in_at, check_out_at, is_bank_transfer, num_of_room) VALUES
('74e8a7d5-f613-41b7-bcaf-6a64049ac4c7', 'b3d7f6a1-e4d5-413e-a4ff-2f89a3c9b2a3', '5dc8fd4a-3571-43b9-bc2f-9f5ea7cd1b0c', 'f2c3d4e5-2222-4a6b-c789-2345678901bc', 1747331741, 1747418141, true, 1);
