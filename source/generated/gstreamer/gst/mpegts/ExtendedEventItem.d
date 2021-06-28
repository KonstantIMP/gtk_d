module gst.mpegts.ExtendedEventItem;

private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class ExtendedEventItem
{
	/** the main Gtk struct */
	protected GstMpegtsExtendedEventItem* gstMpegtsExtendedEventItem;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsExtendedEventItem* getExtendedEventItemStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsExtendedEventItem;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsExtendedEventItem;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsExtendedEventItem* gstMpegtsExtendedEventItem, bool ownedRef = false)
	{
		this.gstMpegtsExtendedEventItem = gstMpegtsExtendedEventItem;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsExtendedEventItem);
	}


	/** */
	public @property string itemDescription()
	{
		return Str.toString(gstMpegtsExtendedEventItem.itemDescription);
	}

	/** Ditto */
	public @property void itemDescription(string value)
	{
		gstMpegtsExtendedEventItem.itemDescription = Str.toStringz(value);
	}

	/** */
	public @property string item()
	{
		return Str.toString(gstMpegtsExtendedEventItem.item);
	}

	/** Ditto */
	public @property void item(string value)
	{
		gstMpegtsExtendedEventItem.item = Str.toStringz(value);
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_extended_event_item_get_type();
	}
}
