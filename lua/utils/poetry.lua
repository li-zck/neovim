local poem = {
  {
    "Kim dạ nguyên tiêu nguyệt chính viên,",
    "Xuân giang, xuân thuỷ tiếp xuân thiên.",
    "Yên ba thâm xứ đàm quân sự,",
    "Dạ bán quy lai nguyệt mãn thuyền.",
    "---- Hồ Chí Minh ----",
  },
  {
    "Ngục trung vô tửu diệc vô hoa,",
    "Đối thử lương tiêu nại nhược hà?",
    "Nhân hướng song tiền khán minh nguyệt,",
    "Nguyệt tòng song khích khán thi gia.",
    "---- Hồ Chí Minh ----",
  },
  {
    "Tiếng suối trong như tiếng hát xa,",
    "Trăng lồng cổ thụ, bóng lồng hoa.",
    "Cảnh khuya như vẽ, người chưa ngủ,",
    "Chưa ngủ vì lo nỗi nước nhà.",
    "---- Hồ Chí Minh ----",
  },
  {
    "Ả ở đâu ta bán chiếu gon,",
    "Chẳng hay chiếu ấy hết hay còn?",
    "Xuân thu phỏng độ chừng bao tuổi,",
    "Đã có chồng chưa, được mấy con?",
    "---- Nguyễn Trãi ----",
  },
  {
    "Tẩu lộ tài tri tẩu lộ nan",
    "Trùng san chi ngoại hựu trùng san",
    "Trùng san đăng đáo cao phong hậu",
    "Vạn lý dư đồ cố miện gian.",
    "---- Hồ Chí Minh ----",
  },
  {
    "Một mai, một cuốc, một cần câu,",
    "Thơ thẩn dầu ai vui thú nào.",
    "Ta dại, ta tìm nơi vắng vẻ,",
    "Người khôn, người đến chốn lao xao.",
    "Thu ăn măng trúc, đông ăn giá,",
    "Xuân tắm hồ sen, hạ tắm ao.",
    "Rượu đến bóng cây ta hãy uống,",
    "Nhìn xem phú quý tựa chiêm bao.",
    "---- Nguyễn Bình Khiêm ----",
  },
  {
    "Thân em thời trắng phận em tròn,",
    "Bảy nổi ba chìm mấy nước non.",
    "Rắn nát mặc dầu tay kẻ nặn,",
    "Nhưng em vẫn giữ tấm lòng son.",
    "---- Hồ Xuân Hương ----",
  },
  {
    "Bác mẹ sinh ra phận ốc nhồi,",
    "Đêm ngày lăn lóc đám cỏ hôi.",
    "Quân tử có thương thì bóc yếm",
    "Xin đừng ngó ngoáy lỗ trôn tôi.",
    "---- Hồ Xuân Hương ----",
  },
  {
    "Khéo khéo đi đâu lũ ngẩn ngơ,",
    "Lại đây chị dạy lối làm thơ.",
    "Bướm non ngứa lợi châm hoa rữa,",
    "Dê bé buồn sừng húc giậu thưa.",
    "---- Hồ Xuân Hương ----",
  },
  {
    "Trời đất sinh ra đá một chòm,",
    "Nứt làm đôi mảnh hổng hòm hom.",
    "Kẽ hầm rêu mọc trơ toen hoẻn,",
    "Luồng gió thông reo vố phập phồm.",
    "Giọt nước hữu trình rơi lõm bõm",
    "Con đường vô ngạn tối om om.",
    "Khen ai đẽo đá tài xuyên tạc,",
    "Khéo hớ hênh ra lắm kẻ dòm.",
    "---- Hồ Xuân Hương ----",
  },
  {
    "Nên nính thượng thức cao thâm xứ,",
    "Mạc quái anh hùng lưỡng thủ mô.",
    "---- Hồ Xuân Hương ----",
  },
  {
    "Hỏi thế gian tình ái là chi",
    "Mà đôi lứa thề nguyền sống chết",
    "Nam bắc hai đàng rồi ly biệt",
    "Mưa dầm dãi nắng hai ngả quan san",
    "Thiếp nhớ chàng muôn ngàn đau khổ",
    "Thiếp nhớ chàng khốn khổ xiết bao",
    "Giờ chàng đang ở nơi nao",
    "Nhấp nhô mây núi nao nao cõi lòng.",
  },
  {
    "Nhật chiếu Hương Lô sinh tử yên,",
    "Dao khan bộc bố quải tiền xuyên.",
    "Phi lưu trực há tam thiên xích,",
    "Nghi thị Ngân Hà lạc cửu thiên.",
    "---- Lý Bạch ----",
  },
}

local function get_header(index, random)
  if random then
    -- Return a random header if random is true
    math.randomseed(os.time()) -- Seed to get a different random each time
    return poem[math.random(1, #poem)]
  elseif index then
    -- Return the header at the specified index
    return poem[index]
  else
    -- Default to the first header if neither is specified
    return poem[6]
  end
end

return get_header
