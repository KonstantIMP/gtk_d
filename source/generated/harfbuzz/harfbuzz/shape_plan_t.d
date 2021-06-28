module harfbuzz.shape_plan_t;

private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * Data type for holding a shaping plan.
 * 
 * Shape plans contain information about how HarfBuzz will shape a
 * particular text segment, based on the segment's properties and the
 * capabilities in the font face in use.
 * 
 * Shape plans can be queried about how shaping will perform, given a set
 * of specific input parameters (script, language, direction, features,
 * etc.).
 */
public struct shape_plan_t
{

	/** */
	public static GType getType()
	{
		return hb_gobject_shape_plan_get_type();
	}
}
