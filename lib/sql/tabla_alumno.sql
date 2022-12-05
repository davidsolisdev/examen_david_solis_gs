CREATE TABLE alm_alumno(
    alm_id INTEGER PRIMARY KEY AUTOINCREMENT,
    alm_codigo VARCHAR(100) NOT NULL,
    alm_nombre VARCHAR(300) NOT NULL,
    alm_edad INTEGER NOT NULL,
    alm_sexo VARCHAR(100) NOT NULL,
    alm_id_grd INTEGER,
    alm_observacion VARCHAR(300),
    FOREIGN KEY(alm_id_grd) REFERENCES grd_grado(grd_id)
);