module gstreamer.DebugMessage;

private import glib.Str;
private import glib.c.functions;
private import gstreamer.c.functions;
public  import gstreamer.c.types;


/** */
public struct DebugMessage
{

	/**
	 * Gets the string representation of a #GstDebugMessage. This function is used
	 * in debug handlers to extract the message.
	 *
	 * Returns: the string representation of a #GstDebugMessage.
	 */
	public static string get(GstDebugMessage* message)
	{
		return Str.toString(gst_debug_message_get(message));
	}
}
