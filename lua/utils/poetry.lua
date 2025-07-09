local poem = {
  {
    "Kim dạ nguyên tiêu nguyệt chính viên,",
    "Xuân giang, xuân thuỷ tiếp xuân thiên.",
    "Yên ba thâm xứ đàm quân sự,",
    "Dạ bán quy lai nguyệt mãn thuyền.",
  },

  {
    "Ngục trung vô tửu diệc vô hoa,",
    "Đối thử lương tiêu nại nhược hà?",
    "Nhân hướng song tiền khán minh nguyệt,",
    "Nguyệt tòng song khích khán thi gia.",
  },
  {
    "Tiếng suối trong như tiếng hát xa,",
    "Trăng lồng cổ thụ, bóng lồng hoa.",
    "Cảnh khuya như vẽ, người chưa ngủ,",
    "Chưa ngủ vì lo nỗi nước nhà.",
  },
  {
    "Ả ở đâu ta bán chiếu gon,",
    "Chẳng hay chiếu ấy hết hay còn?",
    "Xuân thu phỏng độ chừng bao tuổi,",
    "Đã có chồng chưa, được mấy con?",
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
    return poem[1]
  end
end

return get_header
