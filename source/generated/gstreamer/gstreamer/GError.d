module gstreamer.GError;

private import glib.Str;
private import glib.c.functions;
private import gstreamer.c.functions;
public  import gstreamer.c.types;


/** */
public struct GError
{

	/**
	 * Get a string describing the error message in the current locale.
	 *
	 * Params:
	 *     domain = the GStreamer error domain this error belongs to.
	 *     code = the error code belonging to the domain.
	 *
	 * Returns: a newly allocated string describing
	 *     the error message (in UTF-8 encoding)
	 */
	public static string errorGetMessage(GQuark domain, int code)
	{
		auto retStr = gst_error_get_message(domain, code);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}
}
