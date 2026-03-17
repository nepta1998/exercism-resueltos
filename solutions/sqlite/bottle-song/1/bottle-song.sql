-- Schema:
-- CREATE TABLE "bottle-song" (
--         start_bottles INTEGER NOT NULL,
--         take_down     INTEGER NOT NULL,
--         result        TEXT
-- );
-- Task: update bottle-song table and set the result based on the
-- start_bottles and take_down.


WITH RECURSIVE mapping(num, word_cap, word_low, suffix) AS (
    VALUES 
        (10, 'Ten', 'ten', 'bottles'), (9, 'Nine', 'nine', 'bottles'),
        (8, 'Eight', 'eight', 'bottles'), (7, 'Seven', 'seven', 'bottles'),
        (6, 'Six', 'six', 'bottles'), (5, 'Five', 'five', 'bottles'),
        (4, 'Four', 'four', 'bottles'), (3, 'Three', 'three', 'bottles'),
        (2, 'Two', 'two', 'bottles'), (1, 'One', 'one', 'bottle'),
        (0, 'No', 'no', 'bottles')
)
UPDATE "bottle-song"
SET result = (
    WITH RECURSIVE steps(current_n, target_n) AS (
        -- Aquí conectamos con la tabla exterior usando sus valores
        SELECT start_bottles, (start_bottles - take_down)
        UNION ALL
        SELECT current_n - 1, target_n
        FROM steps
        WHERE current_n > target_n + 1
    )
    SELECT GROUP_CONCAT(
        (SELECT m.word_cap || ' green ' || m.suffix FROM mapping m WHERE m.num = s.current_n) || ' hanging on the wall,' || CHAR(10) ||
        (SELECT m.word_cap || ' green ' || m.suffix FROM mapping m WHERE m.num = s.current_n) || ' hanging on the wall,' || CHAR(10) ||
        'And if one green bottle should accidentally fall,' || CHAR(10) ||
        'There''ll be ' || 
        (SELECT m.word_low || ' green ' || m.suffix FROM mapping m WHERE m.num = s.current_n - 1) || 
        ' hanging on the wall.',
        CHAR(10) || CHAR(10)
    )
    FROM steps s
);