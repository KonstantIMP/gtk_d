module harfbuzz.face_t;

private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * Data type for holding font faces.
 */
public struct face_t
{

	/** */
	public static GType getType()
	{
		return hb_gobject_face_get_type();
	}
}
