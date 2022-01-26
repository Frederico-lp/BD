.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;

-- Notificar o utilizador quando novo episódio for lançado. 
-- (NOTA: é utilizado o auto increment no id da tabela Notification 
-- para inserir uma nova notificação, de modo a não inserir o id manualmente).

CREATE TRIGGER IF NOT EXISTS GATILHO_1
AFTER INSERT ON Episode

BEGIN
    INSERT INTO Notification
    SELECT NULL,'Episode ' || NEW.name || ' was added', id_User
    FROM Following, (
        SELECT id_Serie as id_of_serie
        FROM Season
        WHERE id_Serie = (
            SELECT id_Serie 
            FROM Season
            WHERE id = NEW.id_Season
            )
    )
    WHERE id_Serie = id_of_serie;
END;
