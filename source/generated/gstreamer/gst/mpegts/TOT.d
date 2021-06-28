module gst.mpegts.TOT;

private import glib.MemorySlice;
private import glib.PtrArray;
private import gobject.ObjectG;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import gstreamer.DateTime;
private import linker.loader;


/**
 * Time Offset Table (EN 300 468)
 */
public final class TOT
{
	/** the main Gtk struct */
	protected GstMpegtsTOT* gstMpegtsTOT;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsTOT* getTOTStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsTOT;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsTOT;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsTOT* gstMpegtsTOT, bool ownedRef = false)
	{
		this.gstMpegtsTOT = gstMpegtsTOT;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsTOT);
	}


	/** */
	public @property DateTime utcTime()
	{
		return ObjectG.getDObject!(DateTime)(gstMpegtsTOT.utcTime, false);
	}

	/** Ditto */
	public @property void utcTime(DateTime value)
	{
		gstMpegtsTOT.utcTime = value.getDateTimeStruct();
	}

	/**
	 * List of descriptors
	 */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsTOT.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsTOT.descriptors = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_tot_get_type();
	}
}
