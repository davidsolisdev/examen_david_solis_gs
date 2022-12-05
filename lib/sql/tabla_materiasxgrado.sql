CREATE TABLE mxg_materiasxgrado(
    mxg_id INTEGER PRIMARY KEY AUTOINCREMENT,
    mxg_id_grd INTEGER,
    mxg_id_mat INTEGER,
    FOREIGN KEY(mxg_id_grd) REFERENCES grd_grado(grd_id),
    FOREIGN KEY(mxg_id_mat) REFERENCES mat_materia(mat_id)
);