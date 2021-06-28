module gstreamer.TracerRecord;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gstreamer.ObjectGst;
private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * Tracing modules will create instances of this class to announce the data they
 * will log and create a log formatter.
 *
 * Since: 1.8
 */
public class TracerRecord : ObjectGst
{
	/** the main Gtk struct */
	protected GstTracerRecord* gstTracerRecord;

	/** Get the main Gtk struct */
	public GstTracerRecord* getTracerRecordStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstTracerRecord;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gstTracerRecord;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstTracerRecord* gstTracerRecord, bool ownedRef = false)
	{
		this.gstTracerRecord = gstTracerRecord;
		super(cast(GstObject*)gstTracerRecord, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gst_tracer_record_get_type();
	}
}
