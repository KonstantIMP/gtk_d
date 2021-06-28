module harfbuzz.blob_t;

private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * Data type for blobs. A blob wraps a chunk of binary
 * data and facilitates its lifecycle management between
 * a client program and HarfBuzz.
 */
public struct blob_t
{

	/** */
	public static GType getType()
	{
		return hb_gobject_blob_get_type();
	}
}
