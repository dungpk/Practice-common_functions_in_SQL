SELECT 
    *
FROM
    quanlysinhvien.subject;
use quanlysinhvien;

INSERT INTO Subject
VALUES (5, 'JAVA', 5, 1),
       (6, 'JS', 6, 1),
       (7, 'HTML', 5, 1),
       (8, 'CSS', 10, 1);
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT 
    *
FROM
    subject
WHERE
    Credit = (SELECT 
            MAX(Credit)
        FROM
            subject)thông tin môn học có điểm thi lớn nhất.
SELECT S.subname,S.subID,MAX(m.mark)
from Subject S  join Mark M on S.subid = M.subid
group by  S.subname,S.subID
-- HAVING MAX(Mark) >= ALL (SELECT MAX(Mark) FROM Mark GROUP BY Mark.mark);
;


SELECT 
    Stu.StudentName, M.mark, S.subname
FROM
    mark M
        JOIN
    Subject S ON M.subID = S.subID
        JOIN
    Student Stu ON M.studentID = Stu.studentID
GROUP BY S.subname , Stu.StudentName , M.mark
HAVING MAX(Mark) >= ALL (SELECT 
        MAX(Mark)
    FROM
        Mark
    GROUP BY Mark.mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT Stu.StudentName, Stu.StudentID, AVG(M.Mark)
FROM student Stu
LEFT JOIN Mark M ON Stu.studentID = M.StudentID
GROUP BY Stu.StudentID
ORDER BY AVG(M.Mark) DESC;
