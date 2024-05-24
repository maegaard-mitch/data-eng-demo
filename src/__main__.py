import polars as pl
import pandera.polars as pa

class Schema(pa.DataFrameModel):
    id: pl.Int64 = pa.Field(ge=0, le=3)
    col2: pl.String = pa.Field(str_startswith="row")
    col3: pl.String

    class Config:
        name = "BaseSchema"
        strict = True
        coerce = True

if __name__ == "__main__":
    df = pl.read_csv("data/file.csv", separator="|").lazy()
    validated_df = Schema.validate(df.collect(), lazy=True)
    print(validated_df)
