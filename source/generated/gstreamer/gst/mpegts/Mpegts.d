module gst.mpegts.Mpegts;

private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;


/** */
public struct Mpegts
{

	/**
	 * Initializes the MPEG-TS helper library. Must be called before any
	 * usage.
	 */
	public static void initialize()
	{
		gst_mpegts_initialize();
	}
}
